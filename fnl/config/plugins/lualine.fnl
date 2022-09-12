(import-macros {: vmode?} :macros)

(macro is-filetype? [...]
  (icollect [_ value# (ipairs [...]) :into '(or)] `(= vim.bo.filetype ,value#)))

(fn get-wordcount []
  "Return wordcount for text files with support for counting visually selected words"
  (if (is-filetype? :md :txt :markdown :vimwiki)
    ;; We query the visual_words field but only use it when we're in visual 
    ;; mode so we're certain that it won't be nil
    (let [{: words : visual_words} (vim.fn.wordcount)]
      (local wordcount (if (vmode?) visual_words words))
      (local rest (if (vmode?)
                    (if (= wordcount 1)
                      (.. " word of " words)
                      (.. " words of " words))
                    (if (= wordcount 1)
                       (.. " word")
                       (.. " words"))))
      (.. wordcount rest))
    ""))

(let [{: create-conf} (require :utils)]
  (create-conf :lualine {:options {:component_separators {:left "" :right ""}
                                   :section_separators {:left "" :right ""}}
                         :sections {:lualine_x ["encoding" "fileformat" get-wordcount "filetype"]}}))

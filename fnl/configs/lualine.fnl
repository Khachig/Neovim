(fn get-wordcount []
  "Return wordcount for text files with support for counting visually selected words"
  (if (or (= vim.bo.filetype :md) (= vim.bo.filetype :txt) (= vim.bo.filetype :markdown))
    ;; We query the visual_words field but only use it when we're in visual 
    ;; mode so we're certain that it won't be nil
    (let [{: words : visual_words} (vim.fn.wordcount)
          nvim-mode (. (vim.api.nvim_get_mode) :mode)]
      (local wordcount (if (= nvim-mode "v") visual_words words))
      (local rest (if (= nvim-mode "v")
                    (if (= wordcount 1)
                      (.. " word of " words)
                      (.. " words of " words))
                    (if (= wordcount 1)
                       (.. " word")
                       (.. " words"))))
      (.. wordcount rest))
    ""))

(let [{: create-conf} (require :utils)]
  (create-conf :lualine {:sections {:lualine_x ["encoding" "fileformat" get-wordcount "filetype"]}}))

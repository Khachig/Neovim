(fn get-wordcount []
  (if (or (= vim.bo.filetype :md) (= vim.bo.filetype :txt) (= vim.bo.filetype :markdown))
    (let [wordcount (. (vim.fn.wordcount) :words)]
      (if (= wordcount 1)
        (.. wordcount " word")
        (.. wordcount " words")))
    ""))


(let [{: create-conf} (require :utils)]
  (create-conf :lualine {:sections {:lualine_x ["encoding" "fileformat" get-wordcount "filetype"]}}))

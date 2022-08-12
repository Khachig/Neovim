(fn nvim-mode! [] `(. (vim.api.nvim_get_mode) :mode))
(fn vmode? [] `(= (. (vim.api.nvim_get_mode) :mode) "v"))
(fn nmode? [] `(= (. (vim.api.nvim_get_mode) :mode) "n"))
(fn imode? [] `(= (. (vim.api.nvim_get_mode) :mode) "i"))

(fn set! [name value]
  (let [name (tostring name)
        nil-value? (= nil value)
        name-startswith-no? (= (name:sub 1 2) "no")
        name (if (and nil-value? name-startswith-no?) (name:sub 3) name)
        value (if nil-value? (not name-startswith-no?) value)]
    `(tset vim.opt ,name ,value)))

(fn au! [group-name ...]
  `(let [commands# [,...]
         gn# (.. "augroup " ,group-name)]
      (vim.api.nvim_command gn#)
      (vim.api.nvim_command "autocmd!")
      (for [i# 1 (length commands#)]
        (vim.api.nvim_command (.. "autocmd " (. commands# i#))))
      (vim.api.nvim_command "augroup END")))

{: set! : au! : nvim-mode! : vmode? : nmode? : imode?}

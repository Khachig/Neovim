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

(fn setg! [name value]
  (let [name (tostring name)
        nil-value? (= nil value)
        name-startswith-no? (= (name:sub 1 2) "no")
        name (if (and nil-value? name-startswith-no?) (name:sub 3) name)
        value (if nil-value? (not name-startswith-no?) value)]
    `(tset vim.g ,name ,value)))

(fn au! [group-name ...]
  (let [gr-name (.. "augroup " group-name)]
    `(do 
       (vim.api.nvim_command ,gr-name)
       (vim.api.nvim_command "autocmd!")
       ,(icollect [_ cmd# (ipairs [...]) :into '(do)]
          (let [autocmd# (.. "autocmd " cmd#)]
            `(vim.api.nvim_command ,autocmd#)))
        (vim.api.nvim_command "augroup END"))))

{: set! : setg! : au! : nvim-mode! : vmode? : nmode? : imode?}

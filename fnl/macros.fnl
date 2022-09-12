(global M {})

(fn M.nvim-mode [] `(. (vim.api.nvim_get_mode) :mode))
(fn M.vmode? [] `(= (. (vim.api.nvim_get_mode) :mode) "v"))
(fn M.nmode? [] `(= (. (vim.api.nvim_get_mode) :mode) "n"))
(fn M.imode? [] `(= (. (vim.api.nvim_get_mode) :mode) "i"))

(fn M.map [mapping action ?mode ?opts]
  `(vim.api.nvim_set_keymap ,(or ?mode "n") ,mapping ,action ,(or ?opts {:noremap true :silent true})))

(fn M.set! [name value]
  (let [name (tostring name)
        nil-value? (= nil value)
        name-startswith-no? (= (name:sub 1 2) "no")
        name (if (and nil-value? name-startswith-no?) (name:sub 3) name)
        value (if nil-value? (not name-startswith-no?) value)]
    `(tset vim.opt ,name ,value)))

(fn M.setg! [name value]
   (let [name (tostring name)
         nil-value? (= nil value)
         name-startswith-no? (= (name:sub 1 2) "no")
         name (if (and nil-value? name-startswith-no?) (name:sub 3) name)
         value (if nil-value? (not name-startswith-no?) value)]
     `(tset vim.g ,name ,value)))


(fn M.cmd [...]
   (let [cmdstrings# (icollect [_ cmd# (ipairs [...])]
                       (tostring cmd#))]
     `(vim.cmd ,(table.concat cmdstrings# " "))))


(fn M.safe-require [name]
  (local pack# (sym name))
  `(let [(ok?# ,pack#) (pcall require ,name)]
     (if (not ok?#)
       (vim.notify ,(.. name " not found") "error")
       ,pack#)))

(fn M.create-conf [name ?options ?err]
  (let [pack# (sym name)]
    `(do
       ,(M.safe-require name)
       ,(pack#.setup (or ?options {})))))

(fn M.au! [group-name ...]
  (let [gr-name (.. "augroup " group-name)]
    `(do 
       (vim.api.nvim_command ,gr-name)
       (vim.api.nvim_command "autocmd!")
       ,(icollect [_ cmd# (ipairs [...]) :into '(do)]
          (let [autocmd# (.. "autocmd " cmd#)]
            `(vim.api.nvim_command ,autocmd#)))
        (vim.api.nvim_command "augroup END"))))

M

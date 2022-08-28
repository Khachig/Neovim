(import-macros {: set! : vmode?} :fnl.macros)

(macro is-filetype? [...]
  (icollect [_ value# (ipairs [...]) :into '(or)] `(= vim.bo.filetype ,value#)))

(global Commands {})
(fn Commands.Writer []
  (let [bg-state vim.opt.background._value]
    (vim.cmd "TZAtaraxis")
    (if (= bg-state :dark)
      (do
        (set! background "light")
        (vim.cmd "PencilSoft"))
      (do
        (set! background "dark")
        (vim.cmd "PencilOff")))))
    ;(vim.cmd "PencilToggle")))

(each [command function (pairs Commands)]
  (vim.api.nvim_create_user_command command function {}))

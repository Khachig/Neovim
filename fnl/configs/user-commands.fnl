(import-macros {: set! : vmode?} :macros)

(macro is-filetype? [...]
  (icollect [_ value# (ipairs [...]) :into '(or)] `(= vim.bo.filetype ,value#)))

(global Commands {})
(fn Commands.Writer []
  (let [bg-state vim.opt.background._value]
    (if (= bg-state :dark)
      (set! background "light")
      (set! background "dark"))
    (vim.cmd "TZAtaraxis")
    (vim.cmd "PencilToggle")))

(each [command function (pairs Commands)]
  (vim.api.nvim_create_user_command command function {}))

(global Commands {})
(tset Commands :Writer
  (fn []
    (let [bg-state vim.opt.background._value]
      (if (= bg-state :dark)
        (vim.cmd "set background=light")
        (vim.cmd "set background=dark")))))

(each [command function (pairs Commands)]
  (vim.api.nvim_create_user_command command function {}))

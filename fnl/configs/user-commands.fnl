(fn toggle-background []
  (let [bg-state vim.opt.background._value]
    (if (= bg-state :dark)
      (vim.cmd "set background=light")
      (vim.cmd "set background=dark"))))

(vim.api.nvim_create_user_command "Writer" toggle-background {})

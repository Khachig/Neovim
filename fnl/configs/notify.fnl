(let [{: create-conf} (require :utils)]
  (set vim.notify
    (create-conf :notify {:stages "fade"})))

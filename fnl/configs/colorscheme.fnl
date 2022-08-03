(let [colorscheme :everforest]
  (let [(status-ok? _) (pcall vim.cmd (.. "colorscheme " colorscheme))]
    (if (not status-ok?)
      (vim.notify (.. "Colorscheme " colorscheme " not found!") "error"))))

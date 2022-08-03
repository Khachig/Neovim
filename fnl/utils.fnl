(fn create-conf [name ?options ?err]
  (let [(status-ok? pack) (pcall require name)]
    (if (not status-ok?)
      (vim.notify (or ?err (.. name " not found")) "error")
      (do
       (pack.setup (or ?options {}))
       (. [pack] 1)))))
        
{:create-conf create-conf}

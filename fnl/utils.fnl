(module fnl.utils)

(defn create-conf [name ?options ?err]
  (let [(status-ok? pack) (pcall require name)]
    (if (not status-ok?)
      (vim.notify (or ?err (.. name " not found")) "error")
      (do
       (pack.setup (or ?options {}))
       pack))))

(defn safe-require [name]
  (let [(status-ok? pack) (pcall require name)]
    (if (not status-ok?)
      (vim.notify (.. name " not found") "error")
      pack)))

(let [{: create-conf} (require :utils)]
  (create-conf :neo-tree
    {:close_if_last_window true
     :popup_border_style "rounded"
     :enable_diagnostics false
     :window {:width 25}
     :filesystem {:follow_current_file true
                  :use_libuv_file_watcher true}}))

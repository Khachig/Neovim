(let [{: create-conf} (require :utils)
      telescope (create-conf :telescope {:defaults
                                          {:layout-config
                                            {:vertical {:width 0.5}}}})]
  (telescope.load_extension :file_browser))

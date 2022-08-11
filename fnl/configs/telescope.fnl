(let [{: create-conf} (require :utils)
      telescope (create-conf :telescope)]
  (telescope.load_extension :file_browser))

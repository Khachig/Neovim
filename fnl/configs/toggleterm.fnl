(let [{: create-conf} (require :utils)]
  (create-conf :toggleterm
    {:open_mapping "<C-/>"
     :direction "float"
     :float_opts {:border "curved"}}))

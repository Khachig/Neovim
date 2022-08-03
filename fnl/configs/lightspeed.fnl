(set vim.g.lightspeed_no_default_keymaps 1)
(let [{: create-conf} (require :utils)]
  (create-conf :lightspeed))

(let [default-keymaps 
      [
       ["n" "s" "<Plug>Lightspeed_s"]
       ["n" "S" "<Plug>Lightspeed_S"]
       ["x" "s" "<Plug>Lightspeed_s"]
       ["x" "S" "<Plug>Lightspeed_S"]
       ["o" "z" "<Plug>Lightspeed_s"]
       ["o" "Z" "<Plug>Lightspeed_S"]
       ["n" "gs" "<Plug>Lightspeed_gs"]
       ["n" "gS" "<Plug>Lightspeed_gS"]
       ["o" "x" "<Plug>Lightspeed_x"]
       ["o" "X" "<Plug>Lightspeed_X"]
       ["n" "f" "<Plug>Lightspeed_f"]
       ["n" "F" "<Plug>Lightspeed_F"]
       ["x" "f" "<Plug>Lightspeed_f"]
       ["x" "F" "<Plug>Lightspeed_F"]
       ["o" "f" "<Plug>Lightspeed_f"]
       ["o" "F" "<Plug>Lightspeed_F"]
       ["n" "t" "<Plug>Lightspeed_t"]
       ["n" "T" "<Plug>Lightspeed_T"]
       ["x" "t" "<Plug>Lightspeed_t"]
       ["x" "T" "<Plug>Lightspeed_T"]
       ["o" "t" "<Plug>Lightspeed_t"]
       ["o" "T" "<Plug>Lightspeed_T"]
       ["n" ";" "<Plug>Lightspeed_;_ft"]
       ["x" ";" "<Plug>Lightspeed_;_ft"]
       ["o" ";" "<Plug>Lightspeed_;_ft"]]]
  (each [_ keymap (ipairs default-keymaps)]
    (let [[mode lhs rhs] keymap]
      (if (and (= "" (vim.fn.mapcheck lhs mode)) (= 0 (vim.fn.hasmapto rhs mode)))
        (vim.api.nvim_set_keymap mode lhs rhs {:silent true})))))
       
       
       

                       

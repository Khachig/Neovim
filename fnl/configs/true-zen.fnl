(let [{: create-conf} (require :utils)]
  (create-conf :true-zen {:modes
                            {:ataraxis
                               {:quit_untoggles false
                                :minimum_writing_area {:width 100}}}
                          :integrations {:twilight true :lualine true}}))

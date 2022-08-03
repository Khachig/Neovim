(let [{: create-conf} (require :utils)]
  (create-conf :nvim-treesitter.configs
    {
     :ensure_installed [:c :lua :commonlisp :javascript :typescript :html :json :python :fennel]
     :highlight {:enable true}
     :incremental_selection {:enable true}
     :textobjects {:enable true}
     :rainbow {:enable true}}))
     

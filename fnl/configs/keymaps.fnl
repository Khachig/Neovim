(var keymap vim.api.nvim_set_keymap)

(fn set-keymaps [maps]
  (each [_ m (ipairs maps)]
    (let [(key val t opts) (unpack m)
          all-opts {:noremap true :silent true}]
      (each [k v (pairs (or opts {}))]
        (tset all-opts k v))
      (keymap (or t "n") key val all-opts))))

(set vim.g.mapleader ",")
(let [keymaps
      [
       ;; Remap 0 to first non-whitespace character
       ["0" "^"]

       ;; Move cursor through display lines instead of only actual lines
       ["j" "gj"]
       ["k" "gk"]

       ;; Search
       ["<Space>" "/"]
       ["<C-Space>" "?"]

       ;; Quick switch window
       ["<C-h>" "<C-w>h"]
       ["<C-j>" "<C-w>j"]
       ["<C-k>" "<C-w>k"]
       ["<C-l>" "<C-w>l"]
       
       ;; Quick switch buffer
       ["<S-h>" ":bprevious<CR>"]
       ["<S-l>" ":bnext<CR>"]

       ;; Resize with arrow keys
       ["<C-Up>" ":resize -2<CR>"]
       ["<C-Down>" ":resize +2<CR>"]
       ["<C-Left>" ":vertical resize -2<CR>"]
       ["<C-Right>" ":vertical resize +2<CR>"]]]
  (set-keymaps keymaps))

(let [{: create-conf} (require :utils)]
  ((. (create-conf :which-key) :register)
   {
    :<leader>
     {
      :w [":w<CR>" "Quick Save"]
      :q [":q<CR>" "Quick Quit"]
      :Q [":q!<CR>" "Force quit"]

      :n [":Neotree toggle<CR>" "Toggle Neotree"]
      :o [":Neotree focus<CR>" "Focus Neotree"]

      :b {
          :name "+Buffer"
          :d [":Bdelete<CR>" "Delete Buffer"]}

      :<CR> [":noh<CR>" "Unhighlight Search"]

      :c {:name "+NerdComment"}

      :s {
          :name "+Search"
          :f [":Telescope find_files<CR>" "Find File"]
          :r [":Telescope oldfiles<CR>" "Find Recent"]
          :g [":Telescope live_grep<CR>" "Live Grep"]
          :b [":Telescope buffers<CR>" "Find Buffer"]
          :h [":Telescope help_tags<CR>" "Help Menu"]
          :t [":Telescope<CR>" "Launch Telescope"]}
       
      :e {
           :name "+Eval"
           :r [":ConjureEvalRootForm<CR>" "Eval Root Form"]
           :R [":ConjureEvalReplaceForm<CR>" "Eval Replace Form"]
           :e [":ConjureEvalCurrentForm<CR>" "Eval Current Form"]
           :v [":ConjureEvalVisual<CR>" "Eval Visual Selection"]}}}))

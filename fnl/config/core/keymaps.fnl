(import-macros {: setg! : map} :macros)

;; Map leader to Space
(set vim.g.mapleader " ")

;; Remap 0 to first non-whitespace character
(map "0" "^")

;; Move cursor through display lines instead of only actual lines
(map "j" "gj")
(map "k" "gk")

;; Remove highlighting
(map "<leader><CR>" ":noh<CR>")

;; Personal command keymaps

; Toggle Writer mode
(map "<leader>W" ":Writer<CR>")

;; Quick save
(map "<leader>s" ":w<CR>")
;; Quick quit
(map "<leader>q" ":q<CR>")
;; Force quit
(map "<leader>Q" ":q!<CR>")

;; Aniseed Eval File
(map "<leader>l" ":AniseedEvalFile<CR>")

;; Reload Nvim
(map "<leader>r" ":AniseedEvalFile ~/.nvim/fnl/config/init.fnl<CR>")

;; Packer Sync
(map "<leader>ps" ":PackerSync<CR>")

;; Quick switch window
(map "<C-h>" "<C-w>h")
(map "<C-j>" "<C-w>j")
(map "<C-k>" "<C-w>k")
(map "<C-l>" "<C-w>l")

;; Quick switch buffer
(map "<S-h>" ":bprevious<CR>")
(map "<S-l>" ":bnext<CR>")

;; Delete current buffer
(map "<leader>bd" ":Bdelete<CR>")

;; Keymaps for better prose writing experience
; Delete word backward
(map "<C-Backspace>" "<ESC>dbxa" :i)
; Delete word forward
(map "<C-DEL>" "<ESC>ldwi" :i)
; Follow file link
(map "<C-CR>" "gf")
; Follow url link
(map "<S-CR>" "gx")

;; Toggleterm
(map "<leader>tv" ":ToggleTermSendVisualSelection<CR>" :v)
(map "<leader>tV" ":ToggleTermSendVisualLines<CR>" :v)

;; Resize with arrow keys
(map "<C-Up>" ":resize -2<CR>")
(map "<C-Down>" ":resize +2<CR>")
(map "<C-Left>" ":vertical resize -2<CR>")
(map "<C-Right>" ":vertical resize +2<CR>")

;; Neotree
(map "<leader>n" ":Neotree toggle<CR>")
(map "<leader>o" ":Neotree focus<CR>")

;; Neogit
(map "<leader>G" ":Neogit<CR>")

;; Telescope
(map "<leader>SF" ":Telescope file_browser<CR>")
(map "<leader>Sf" ":Telescope find_files<CR>")
(map "<leader>Sr" ":Telescope oldfiles<CR>")
(map "<leader>Sg" ":Telescope live_grep<CR>")
(map "<leader>Sb" ":Telescope buffers<CR>")
(map "<leader>Sh" ":Telescope help_tags<CR>")
(map "<leader>St" ":Telescope<CR>")

;; Conjure
(map "<leader>eb" ":ConjureEvalBuf<CR>")
(map "<leader>er" ":ConjureEvalRootForm<CR>")
(map "<leader>eR" ":ConjureEvalReplaceForm<CR>")
(map "<leader>ee" ":ConjureEvalCurrentForm<CR>")
(map "<leader>ev" ":ConjureEvalVisual<CR>")
(map "<leader>ew" ":ConjureEvalWord<CR>")
(map "<leader>em" ":ConjureEvalMarkedForm<CR>")

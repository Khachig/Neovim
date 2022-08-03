(var (status-ok? packer) (pcall require :packer))
(if (not status-ok?) (vim.notify "Packer not found" "error")
  (do
    (packer.init
      {:display {:open_fn (lambda []
                            ((. (require :packer.util) :float) {:border :rounded}))}})
    (packer.startup
      (fn []
        (use "wbthomason/packer.nvim") ; packer can manage itself!
        (use "nvim-lua/plenary.nvim")  ; useful lua functions used by many plugins
        (use "nvim-lua/popup.nvim")
        (use "MunifTanjim/nui.nvim")

        ;; Devicons
        (use "kyazdani42/nvim-web-devicons"
          {:config (fn [] ((require :configs.web-devicons)))})

        ;; Advanced syntax highlighting
        (use "nvim-treesitter/nvim-treesitter"
          {:config (fn [] ((require :configs.treesitter)))})

        ;; Pretty notifications
        (use "rcarriga/nvim-notify"
          {:event "VimEnter"
           :config (fn [] ((require :configs.notify)))})

        ;; Bufferline
        (use "akinsho/bufferline.nvim"
          {:tab "v2.*"
           :requires "kyazdani42/nvim-web-devicons"
           :config (fn [] ((require :configs.bufferline)))})

        ;; Bufdelete
        (use "famiu/bufdelete.nvim"
          {:cmd ["Bdelete" "Bwipeout"]})

        ;; Parinfer
        (use "gpanders/nvim-parinfer")

        ;; Rainbow parentheses!
        (use "p00f/nvim-ts-rainbow")

        ;; Colorscheme
        (use "sainnhe/everforest")

        ;; Interactive development for Lisp
        (use "Olical/Conjure")
        (use "Olical/aniseed")

        ;; Auto match paired delimiters
        (use "windwp/nvim-autopairs"
          {:config (fn [] ((require :configs.autopairs)))})

        (use "tpope/vim-surround")

        ;; Lightspeed
        (use "ggandor/lightspeed.nvim"
          {:config (fn [] ((require :configs.lightspeed)))})

        ;; Window picker
        (use "s1n7ax/nvim-window-picker"
          {:tag "v1.*"
           :config (fn [] ((require :configs.window-picker)))})

        ;; Neotree
        (vim.cmd "let g:neo_tree_remove_legacy_commands = 1")
        (use "nvim-neo-tree/neo-tree.nvim"
          {:branch "v2.x"
           :requires ["MunifTanjim/nui.nvim"]})

        ;; Terminal
        (use "akinsho/toggleterm.nvim"
          {:tag "v2.*"
           :config (fn [] ((require :configs.toggleterm)))})

        ;; Nvim Telescope (fuzzy finder)
        (use "nvim-telescope/telescope.nvim"
          {:cmd "Telescope"})
        
        ;; Nerd commenter
        (use "preservim/nerdcommenter")

        ;; Keybinding hints
        (use "folke/which-key.nvim")
        
        ;; Status line
        (use "nvim-lualine/lualine.nvim"
          {:requires ["kyazdani42/nvim-web-devicons" :opt true]
           :config (fn [] ((require :configs.lualine)))})))))

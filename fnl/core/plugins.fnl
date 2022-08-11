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
          {:config (fn [] (require :configs.web-devicons))})

        ;; Advanced syntax highlighting
        (use "nvim-treesitter/nvim-treesitter"
          {:config (fn [] (require :configs.treesitter))})

        ;; Autocompletion
        (use "neovim/nvim-lspconfig"
          {:config (fn [] (require :configs.lsp))})

        (use "williamboman/nvim-lsp-installer"
          {:config (fn [] (require :configs.lsp-installer))})

        (use "hrsh7th/nvim-cmp"
          {:config (fn [] (require :configs.cmp))})

        (use "hrsh7th/cmp-buffer")

        (use "hrsh7th/cmp-nvim-lsp")

        (use "saadparwaiz1/cmp_luasnip")

        (use "rafamadriz/friendly-snippets")

        (use "L3MON4D3/LuaSnip"
          {:config (fn [] (require :configs.luasnip))})

        ;; Pretty notifications
        (use "rcarriga/nvim-notify"
          {:event "VimEnter"
           :config (fn [] (require :configs.notify))})

        ;; Bufferline
        (use "akinsho/bufferline.nvim"
          {:tab "v2.*"
           :requires "kyazdani42/nvim-web-devicons"
           :config (fn [] (require :configs.bufferline))})

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
        ;(use "Olical/aniseed")
        ;; Cmp source for Conjure
        (use "PaterJason/cmp-conjure")

        ;; Auto match paired delimiters
        (use "windwp/nvim-autopairs"
          {:config (fn [] (require :configs.autopairs))})

        (use "tpope/vim-surround")

        ;; Lightspeed
        (use "ggandor/lightspeed.nvim"
          {:config (fn [] (require :configs.lightspeed))})

        ;; Window picker
        (use "s1n7ax/nvim-window-picker"
          {:tag "v1.*"
           :config (fn [] (require :configs.window-picker))})

        ;; Neotree
        (vim.cmd "let g:neo_tree_remove_legacy_commands = 1")
        (use "nvim-neo-tree/neo-tree.nvim"
          {:branch "v2.x"
           :requires ["MunifTanjim/nui.nvim"]})

        ;; Terminal
        (use "akinsho/toggleterm.nvim"
          {:tag "v2.*"
           :config (fn [] (require :configs.toggleterm))})

        ;; Nvim Telescope (fuzzy finder)
        (use "nvim-telescope/telescope.nvim"
          {:cmd "Telescope"
           :config (fn [] (require :configs.telescope))})
        ;; Telescope file browser
        (use "nvim-telescope/telescope-file-browser.nvim")
        
        ;; Nerd commenter
        (use "preservim/nerdcommenter")

        ;; Keybinding hints
        (use "folke/which-key.nvim")
        
        ;; Status line
        (use "nvim-lualine/lualine.nvim"
          {:requires ["kyazdani42/nvim-web-devicons" :opt true]
           :config (fn [] (require :configs.lualine))})

        ;; Plugin to interface with Sonic-pi
        (use "lilyinstarlight/vim-sonic-pi")))))

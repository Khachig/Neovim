(import-macros {: cmd : set! : setg!} :macros)

(set! noswapfile)
(set! showcmd)
(set! cmdheight 1)
(set! clipboard :unnamedplus)
(set! laststatus 3)

;; Tab Key Options
(set! expandtab)
(set! smarttab)
(set! shiftwidth 4)
(set! tabstop 4)

;; Search Options
(set! hlsearch)
(set! incsearch)
(set! ignorecase)
(set! smartcase)

;; Editor Options
(set! nowrap)
(set! scrolloff 10)
(set! fileencoding :utf-8)
(set! termguicolors)
(set! showmatch)
(set! noshowmode)
(set! relativenumber)
(set! number)
(set! splitright)
(set! splitbelow)

;; Colorscheme ✨
(cmd colorscheme everforest)

;; Macro Performance Optimization
(set! lazyredraw)

;; Miscellaneous Settings
(setg! vimwiki_list [{:path "~/Brain-2.0" :syntax "markdown" :ext ".md"}])

(let [options
       {
	:swapfile false
	:showcmd true
	:cmdheight 1
	:clipboard "unnamedplus"
	:laststatus 3 ; status line spans entire bottom

	;; Tab options
	:expandtab true
	:smarttab true
	:shiftwidth 4
	:tabstop 4

	;; Search options
	:hlsearch true
	:incsearch true
	:ignorecase true
	:smartcase true

	;; Editor options
	:wrap false
	:scrolloff 10
	:fileencoding "utf-8"
	:termguicolors true
	:showmatch true
	:showmode false
	:relativenumber true
	:number true
	:splitright true
	:splitbelow true

	;; Macro performance optimization
	:lazyredraw true
         }]
 (each [key value (pairs options)]
  (tset vim.opt key value)))

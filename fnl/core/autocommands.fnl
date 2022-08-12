(import-macros {: au!} :macros)

(au! "MyAutocmds"
     ;; Disable autocomment on newline
     "FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o"

     ;; Toggle remap caps lock to escape on Nvim enter/exit for better ergonomics
     "VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"
     "VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'"

     ;; Reload Neovim on config file saves
     "BufWritePost ~/.nvim/fnl/core/plugins.fnl cd ~/.nvim | make | cd - | source $MYVIMRC | PackerSync | PackerCompile"
     "BufWritePost ~/.nvim/fnl/configs/*.fnl,~/.nvim/fnl/core/autocommands.fnl,~/.nvim/fnl/core/options.fnl cd ~/.nvim | make | cd - | source $MYVIMRC")

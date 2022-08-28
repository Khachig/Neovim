(import-macros {: au!} :fnl.macros)

(au! "MyAutocmds"
     ;; Disable autocomment on newline
     "FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o"

     ;; Toggle remap caps lock to escape on Nvim enter/exit for better ergonomics
     "VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"
     "VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'"

     ;; Additional Filetypes
     ; Xonsh shell scripts
     "BufNewFile,BufRead .xonshrc set filetype=python"
     "BufNewFile,BufRead *.xsh set filetype=python"

     ;; Reload Neovim on config file saves
     "BufWritePost ~/.nvim/core/plugins.fnl cd ~/.nvim | make | cd - | source $MYVIMRC | PackerSync | PackerCompile"
     "BufWritePost ~/.nvim/configs/*.fnl,~/.nvim/core/autocommands.fnl,~/.nvim/core/options.fnl cd ~/.nvim | make | cd - | source $MYVIMRC")

(import-macros {: au!} :macros)

(au! "MyAutocmds"
     ;; Disable autocomment on newline
     "FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

     ;; Toggle remap caps lock to escape on Nvim enter/exit for better ergonomics
     ;; (commented out since I've set the mapping system wide)
     ;"VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"
     ;"VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'")

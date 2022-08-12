(var cmd vim.api.nvim_command)

(fn autocommand [event pattern action]
  (if (= (type event) "table")
    (cmd (.. "autocmd " (table.concat event ",") " " pattern " " action))
    (cmd (.. "autocmd " event " " pattern " " action))))

(cmd "augroup MyAutocmds")
(cmd "autocmd!")
(let [autocmds
       [
         ;; Disable autocomment on newline
         ["FileType" "*" "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"]

         ;; Toggle remap caps lock to escape on Nvim enter/exit for better ergonomics
         ["VimEnter" "*" "silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"]
         ["VimLeave" "*" "silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'"]

         ;; Reload Neovim depending on config file saves
         ["BufWritePost" "plugins.fnl" "cd ~/.nvim | make | source lua/core/plugins.lua | PackerSync | cd -"]
         ["BufWritePost" "autocommands.fnl,options.fnl,fnl/configs/*.fnl" "cd ~/.nvim | make | source init.lua | cd -"]]]
  (each [_ cmd (ipairs autocmds)]
    (autocommand (unpack cmd))))
(cmd "augroup END")

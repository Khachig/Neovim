(require "core.autocommands")
(require "core.options")
(require "core.plugins")

(each [_ source (ipairs
                 [
                  :configs.autopairs
                  :configs.bufferline
                  :configs.colorscheme
                  :configs.keymaps
                  :configs.lightspeed
                  :configs.lualine
                  :configs.notify
                  :configs.toggleterm
                  :configs.treesitter
                  :configs.web-devicons
                  :configs.window-picker])]
 (let [(status-ok? err-msg) (pcall require source)]
  (if (not status-ok?)
   (error (.. "Failed to load " source "\n\n" err-msg)))))
  

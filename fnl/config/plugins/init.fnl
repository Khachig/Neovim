(macro all-plugins []
  (let [stdpath (vim.fn.stdpath :config)
        plugin-confs (io.popen (.. "ls -A " stdpath "/fnl/config/plugins"))]
    (icollect [plugin# (plugin-confs:lines)]
      (if (not= "init.fnl" plugin#)
        `,(.. "config.plugins." (string.sub plugin# 1 -5))))))

(each [_ plugin (ipairs (all-plugins))]
  (require plugin))

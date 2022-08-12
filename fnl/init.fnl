(let [{: safe-require} (require :utils)
      stdpath (vim.fn.stdpath :config)
      cores (io.popen (.. "ls -A " stdpath "/lua/core"))
      configs (io.popen (.. "ls -A " stdpath "/lua/configs"))]
  (each [core (cores:lines)]
    (safe-require (.. "core/" (string.sub core 1 -5))))
  (each [config (configs:lines)]
    (safe-require (.. "configs/" (string.sub config 1 -5)))))

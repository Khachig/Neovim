(let [{: safe-require} (require :utils)
      stdpath (vim.fn.stdpath :config)
      core-path "/lua/core/"
      conf-path "/lua/configs/"
      cores (io.popen (.. "ls -A " stdpath core-path))
      configs (io.popen (.. "ls -A " stdpath conf-path))]
  (each [core (cores:lines)]
    (safe-require (.. core-path (string.sub core 1 -5))))
  (each [config (configs:lines)]
    (safe-require (.. conf-path (string.sub config 1 -5)))))

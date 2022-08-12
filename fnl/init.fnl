(let [{: safe-require} (require :utils)
      cores (io.popen "ls -A lua/core")
      configs (io.popen "ls -A lua/configs")]
  (each [core (cores:lines)]
    (safe-require (.. "core/" (string.sub core 1 -5))))
  (each [config (configs:lines)]
    (safe-require (.. "configs/" (string.sub config 1 -5)))))

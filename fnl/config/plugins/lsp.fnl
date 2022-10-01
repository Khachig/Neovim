(fn on-attach [client bufnr]
  (vim.api.nvim_set_option "omnifunc" "v:lua.vim.lsp.omnifunc")

  ;; Mappings
  (let [bufopts {:noremap true :silent true}
        keymap vim.api.nvim_set_keymap]
    (keymap "n" "<leader>lD" ":lua vim.lsp.buf.declaration()<CR>" bufopts)
    (keymap "n" "<leader>ld" ":lua vim.lsp.buf.definition()<CR>" bufopts)
    (keymap "n" "<leader>lh" ":lua vim.lsp.buf.hover()<CR>" bufopts)
    (keymap "n" "<leader>li" ":lua vim.lsp.buf.implementation()<CR>" bufopts)
    (keymap "n" "<leader>ls" ":lua vim.lsp.buf.signature_help()<CR>" bufopts)
    (keymap "n" "<leader>lt" ":lua vim.lsp.buf.type_definition()<CR>" bufopts)
    (keymap "n" "<leader>la" ":lua vim.lsp.buf.code_action()<CR>" bufopts)
    (keymap "n" "<leader>lr" ":lua vim.lsp.buf.references()<CR>" bufopts)))

(local lsp-flags {:debounce_text_changes 150})

(let [signs [{:name "DiagnosticSignError" :text ""}
             {:name "DiagnosticSignWarn" :text ""}
             {:name "DiagnosticSignHint" :text ""}
             {:name "DiagnosticSignInfo" :text ""}]]
  (each [_ sign (ipairs signs)]
    (vim.fn.sign_define sign.name {:texthl sign.name :text sign.text :numhl ""})))

(let [{: safe-require} (require :utils)
      insert table.insert
      lspconfig (safe-require :lspconfig)
      lspinstaller (safe-require :nvim-lsp-installer)
      servers {}
      opts {:on_attach on-attach :flags lsp-flags}]
  (each [_ server (ipairs (lspinstaller.get_installed_servers))]
    (insert servers server.name))
  (each [_ server (ipairs servers)]
    ;(if (= server "sumneko_lua")
      ;(vim.tbl_deep_extend "force" opts 
        ;{:settings
         ;{:Lua
          ;{:runtime {:version "LuaJIT"}
           ;:diagnostics {:globals ["vim"]}
           ;:workspace {:library (vim.api.nvim_get_runtime_file "" true)}
           ;:telemetry {:enable false}}}}))
    ((. (. lspconfig server) :setup) opts)))

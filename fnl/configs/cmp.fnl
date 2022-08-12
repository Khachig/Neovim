(local {: safe-require} (require :utils))

(fn has-words-before []
  (let [(line col) (unpack (vim.api.nvim_win_get_cursor 0))
        before (vim.api.nvim_buf_get_lines 0 (- line 1) line true)
        first (. before 1)
        s (first:sub col col)
        m (s:match "%s")]
    (and (not= col 0)) (= m nil)))

(local kind-icons
  {:Text ""
   :Method "m"
   :Function ""
   :Constructor ""
   :Field ""
   :Variable ""
   :Class ""
   :Interface ""
   :Module ""
   :Property ""
   :Unit ""
   :Value ""
   :Enum ""
   :Keyword ""
   :Snippet ""
   :Color ""
   :File ""
   :Reference ""
   :Folder ""
   :EnumMember ""
   :Constant ""
   :Struct ""
   :Event ""
   :Operator ""
   :TypeParameter ""})

(var cmp (safe-require :cmp))
(var luasnip (safe-require :luasnip))
(cmp.setup
  {:snippet {:expand (fn [args]
                       (let [luasnip (require :luasnip)]
                         (luasnip.lsp_expand args.body)))}
   :mapping {:<C-e> (cmp.mapping.abort)
             :<CR> (cmp.mapping.confirm {:select true})
             :<Tab> (cmp.mapping
                      (fn [fallback]
                        (if (cmp.visible)
                            (cmp.select_next_item)
                            (luasnip.expand_or_jumpable)
                            (luasnip.expand_or_jump)
                            (has_words_before)
                            (cmp.complete)
                            (fallback))) [:i :s])
             :<S-Tab> (cmp.mapping
                        (fn [fallback]
                          (if (cmp.visible)
                              (cmp.select_prev_item)
                              (luasnip.jumpable -1)
                              (luasnip.jump -1)
                              (fallback))) [:i :s])}
   :sources (cmp.config.sources
             [{:name "nvim_lsp"}
              {:name "luasnip"}
              {:name "conjure"}
              {:name "path"}]
             [{:name "buffer"}])
   :formatting {:fields [:kind :abbr :menu]
                :format (fn [entry vim-item]
                          (set vim-item.kind (string.format "%s" (. kind-icons vim-item.kind)))
                          (set vim-item.menu (. [:luasnip "[Snippet]" :buffer "[Buffer]" :path "[Path]"] entry.source.name))
                          vim-item)}})

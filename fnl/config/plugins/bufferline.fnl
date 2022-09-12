(let [{: create-conf} (require :utils)]
  (create-conf :bufferline
    {
     :options
     {
      :offsets [
                {:filetype "NvimTree" :text "" :padding 1}
                {:filetype "neo-tree" :text "" :padding 1}
                {:filetype "Outline" :text "" :padding 1}]
      :mode "buffers"
      :tab_size 10
      :color_icons true
      :show_close_icon false
      :show_buffer_close_icons false
      :show_buffer_icons true
      :separator_style "slant"
      :always_show_bufferline true}}))

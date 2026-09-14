vim.pack.add { 'https://github.com/3rd/image.nvim' }

require('image').setup {
  backend = 'kitty',
  processor = 'magick_cli',
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = false,
      only_render_image_at_cursor = false,
      filetypes = { 'markdown', 'vimwiki' },
    },
  },
  max_height_window_percentage = 50,
  hijack_file_patterns = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.webp', '*.avif' },
}

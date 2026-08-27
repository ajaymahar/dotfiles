return {
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",

    build = ":call mkdp#util#install()",

    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
    },

    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(args)
          -- 🔒 KEYMAP UNCHANGED: Preserves your preferred `<leader>pp` mapping exactly
          vim.keymap.set("n", "<leader>pp", "<cmd>MarkdownPreviewToggle<CR>", {
            buffer = args.buf,
            silent = true,
            desc = "Markdown: Toggle browser live preview"
          })
        end,
      })
    end,
  },
}

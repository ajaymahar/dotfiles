return {
  {
    -- nvim file finder or file manager
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = "oil",
      --   callback = function()
      --     vim.opt_local.colorcolumn = ""
      --   end,
      -- })

      require("oil").setup({
        -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
        skip_confirm_for_simple_edits = true,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        -- (:help prompt_save_on_select_new_entry)
        prompt_save_on_select_new_entry = true,
        -- Configuration for the floating window in oil.open_float
        float = {
          -- Padding around the floating window
          padding = 10,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },

        keymaps = {
          ["?"] = "actions.show_help",
          ["l"] = "actions.select",
          ["<C-v>"] = "actions.select_vsplit",
          ["<C-s>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["h"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = false,

        -- -- oil keymaps now set from keymap file
        -- vim.keymap.set("n", "<C-m>", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
      })
    end,
  },
}

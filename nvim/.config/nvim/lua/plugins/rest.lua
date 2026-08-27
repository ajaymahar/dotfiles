return {
  {
    "rest-nvim/rest.nvim",
    ft = { "http" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    init = function()
      -- Global configuration object utilizing strict v3 parameter namespaces
      vim.g.rest_nvim = {
        state = {
          -- Sets the targeted local context variables file configuration
          env_file = ".env",
          env_pattern = "\\.env$",
        },
        request = {
          hooks = {
            encode_url = true,
            skip_ssl_verification = false,
          },
        },
        response = {
          hooks = {
            format = true, -- Auto runs your output structural engines
          },
          ui = {
            split = {
              horizontal = false,
              in_place = true,
              stay_in_current_window_after_split = true,
            },
          },
        },
      }
      ------------------------------------------------------------------
      -- ✨ NEW KEYMAP ADDED explicitly:
      ------------------------------------------------------------------
      -- Pressing <leader>rr inside an HTTP buffer will execute the current API request block
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "http",
        callback = function(args)
          vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>", {
            buffer = args.buf,
            silent = true,
            desc = "HTTP: Execute API request block under cursor"
          })
        end,
      })
    end
  }
}

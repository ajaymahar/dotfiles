return {
  -- plugins/rest.lua
  -- Run export DEBUG_PLENARY="debug" before starting nvim.
  -- Logs will appear most likely in ~/.cache/nvim/rest.nvim.log
  -- Examples:
  -- https://github.com/rest-nvim/rest.nvim/tree/c27a0bcb84ab5534d89065d638119ed2dbbae189/tests
  "rest-nvim/rest.nvim",
  ft = { "http" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = true,
      -- stay in current windows (.http file) or change to results window (default)
      stay_in_current_window_after_split = true,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        -- show the generated curl command in case you want to launch
        -- the same request via the terminal (can be verbose)
        show_curl_command = false,
        show_http_info = true,
        show_headers = true,
        -- table of curl `--write-out` variables or false if disabled
        -- for more granular control see Statistics Spec
        show_statistics = false,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
          end
        },
      },
      -- Jump to request line on run
      jump_to_request = true,
      env_file = '.env',
      -- for telescope select
      env_pattern = "\\.env$",
      env_edit_command = "tabedit",
      custom_dynamic_variables = {},
      yank_dry_run = true,
      search_back = true,
    })
  end
}

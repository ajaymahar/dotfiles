------------------------------------------------------------------
-- 🛠️ Consolidated Native Autocommands Suite
------------------------------------------------------------------

-- 1. Highlight on Yank (Visual feedback when copying text)
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_group,
  pattern = '*',
  callback = function()
    -- Native optimized yank flash wrapper with a 200ms clear visual duration
    vim.hl.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
})

-- 2. Safe, Non-Blocking Format on Save (Unified Engine)
local format_on_save_group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = format_on_save_group,
  pattern = "*",
  desc = "Format buffer safely via active LSP on save",
  callback = function(args)
    -- Fetch the exact file extension being written
    local filename = vim.api.nvim_buf_get_name(args.buf)

    --------------------------------------------------------------
    -- 🛠️ GO SPECIFIC OPTIMIZATION (Replaces broken go.format)
    --------------------------------------------------------------
    if filename:match("%.go$") then
      -- Instruct gopls natively to clean up imports and structure format simultaneously
      local params = vim.lsp.util.make_range_params()
      params.context = { only = { "source.organizeImports" } }

      -- Synchronously execute imports resolution directly at the LSP client channel layer
      local result = vim.lsp.buf_request_sync(args.buf, "textDocument/codeAction", params, 1000)
      for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
          elseif r.command and r.command.command == "gopls.tidy" then
            vim.lsp.buf.execute_command(r.command)
          end
        end
      end
    end

    --------------------------------------------------------------
    -- GLOBAL LSP FALLBACK (For Go, Lua, SQL, JSON, etc.)
    --------------------------------------------------------------
    local clients = vim.lsp.get_clients({ bufnr = args.buf })
    if #clients > 0 then
      -- Perform structural layout cleanup safely right before bit stream commits to drive disk
      vim.lsp.buf.format({ bufnr = args.buf, async = false })
    end
  end,
})

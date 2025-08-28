return {
  "lucaSartore/fastspell.nvim",
  -- runs the plugin’s install script (builds the cspell server)
  build = function()
    local base = vim.fn.stdpath("data") .. "/lazy/fastspell.nvim"
    local cmd = base .. "/lua/scripts/install." .. (vim.fn.has("win32") == 1 and "cmd" or "sh")
    vim.system({ cmd })
  end,
  config = function()
    local fastspell = require("fastspell")
    fastspell.setup({
      -- optional: name the diagnostic namespace
      namespace = "fastspell",
      -- optional: put your cspell.json wherever you like
      cspell_json_file_path = vim.fn.stdpath("config") .. "/cspell.json",
      -- keep diagnostics off for non-file buffers (terminals, trees, etc.)
      filter_by_buf_type = true,
      -- tweak severity if you want them softer
      -- diagnostic_severity = vim.diagnostic.severity.HINT,
    })

    -- === Choose ONE trigger style ===

    -- A) “On-screen” (fast, great default)
    vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufEnter", "WinScrolled" }, {
      callback = function()
        local first = vim.fn.line("w0") - 1
        local last  = vim.fn.line("w$")
        fastspell.sendSpellCheckRequest(first, last)
      end,
      desc = "fastspell: check visible lines",
    })

    -- B) “Near cursor” (uncomment if you prefer super low-noise)
    -- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
    --   callback = function()
    --     local row = vim.api.nvim_win_get_cursor(0)[1]
    --     fastspell.sendSpellCheckRequest(row - 2, row + 1)
    --   end,
    --   desc = "fastspell: check around cursor",
    -- })

    -- Convenience keymaps
    vim.keymap.set("n", "<leader>sc", function()
      local buf = vim.api.nvim_get_current_buf()
      fastspell.sendSpellCheckRequest(0, vim.api.nvim_buf_line_count(buf))
    end, { desc = "[S]pell [C]heck whole buffer" })

    vim.keymap.set("n", "<leader>si", function()
      -- sends an empty range to clear diagnostics
      fastspell.sendSpellCheckRequest(0, 0)
    end, { desc = "[S]pell d[I]smiss diagnostics" })
  end,
}

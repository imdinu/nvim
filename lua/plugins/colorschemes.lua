return {
  -- VSCode look-alike
  { "Mofiqul/vscode.nvim", config = function()
      vim.o.background = "dark"
      require("vscode").setup({ italic_comments = true })
      -- vim.cmd("colorscheme vscode")
    end
  },

  -- Hybrid (Nord + One Dark)
  { "rmehri01/onenord.nvim", config = function()
      require("onenord") --.load()
    end
  },

  -- Polished dark theme
  { "folke/tokyonight.nvim", config = function ()
      -- vim.cmd("colorscheme tokyonight")
    end
  },
}

local lspconfig = require("lspconfig")

local function find_venv(root)
  for _, n in ipairs({ ".venv", "venv", "env" }) do
    local p = (root or vim.fn.getcwd()) .. "/" .. n
    if vim.fn.isdirectory(p) == 1 then return p end
  end
  local v = os.getenv("VIRTUAL_ENV")
  if v and v ~= "" then return v end
end

local function prefer_venv(exe, root)
  local venv = find_venv(root)
  if venv then
    local cand = venv .. "/bin/" .. exe
    if vim.fn.executable(cand) == 1 then return cand end
  end
  local global = vim.fn.exepath(exe)
  return (global ~= "" and global) or exe
end

-- Ruff native language server
lspconfig.ruff.setup({
  cmd = { prefer_venv("ruff"), "server" },
  -- reads pyproject.toml / ruff.toml automatically; add overrides here if you want:
  init_options = { settings = { -- e.g., lineLength = 120
  }},
  on_attach = function(client, _)
    -- Let basedpyright handle hover/signature
    client.server_capabilities.hoverProvider = false
  end,
})

-- Your type checker stays the same (basedpyright / pyright)
-- lspconfig.basedpyright.setup({ ... })

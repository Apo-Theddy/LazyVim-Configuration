return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "java" })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Configurar el servidor de lenguaje Java
        jdtls = {},
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    opts = {
      -- Configura aquí las opciones de jdtls si es necesario
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          require("jdtls").start_or_attach(opts)
        end,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "jdtls" })
      end
    end,
  },
}

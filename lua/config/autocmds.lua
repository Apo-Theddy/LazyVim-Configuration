-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function setup_spring_boot()
  -- Configurar atajos de teclado específicos para Spring Boot
  vim.keymap.set("n", "<leader>sr", ":lua require('jdtls').run_main()<CR>", { buffer = true, desc = "Run Spring Boot application" })
  vim.keymap.set("n", "<leader>st", ":lua require('jdtls').test_class()<CR>", { buffer = true, desc = "Run test class" })
  vim.keymap.set("n", "<leader>sm", ":lua require('jdtls').test_nearest_method()<CR>", { buffer = true, desc = "Run nearest test method" })

  -- Configurar snippets para Spring Boot
  require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/spring-boot" } })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    if vim.fn.glob("pom.xml") ~= "" or vim.fn.glob("build.gradle") ~= "" then
      setup_spring_boot()
    end
  end,
})

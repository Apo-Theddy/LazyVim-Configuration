return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = "ToggleTerm",
    keys = {
      { "<C-t>", "ToggleTerm", desc = "Toggle floating terminal" },
    },
    opts = {
      open_mapping = [[<C-t>]],  -- Ctrl + t para abrir la terminal
      direction = "float",
      shade_filetypes = {},
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
    },
  },
}

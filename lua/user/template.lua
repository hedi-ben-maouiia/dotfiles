vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.c",
  callback = function()
    local template = vim.fn.stdpath("config") .. "/templates/template.c"
    if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
      vim.cmd("0r " .. template)
    end
  end,
})


vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.h",
  callback = function()
    local filename = vim.fn.expand("%:t")
    local guard = filename
      :upper()
      :gsub("%.", "_")
      :gsub("[^A-Z0-9_]", "")

    local lines = {
      "#ifndef " .. guard,
      "#define " .. guard,
      "",
      "",
      "",
      "#endif /* " .. guard .. " */",
    }

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.api.nvim_win_set_cursor(0, {4, 0}) -- place cursor in body
  end,
})

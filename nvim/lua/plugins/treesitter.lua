return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = { "BufReadPre", "BufNewFile" },
  build = function()
    require("nvim-treesitter").install({
      "markdown",
      "markdown_inline",
      "rust",
      "python",
      "lua",
      "bash",
      "json",
      "go",
      "c",
      "cpp",
      "java",
      "javascript",
      "typescript",
      "dart",
      "proto",
    })
  end,
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
  config = function()
    local installed = require("nvim-treesitter.config").get_installed()
    local parsers = {
      "markdown",
      "markdown_inline",
      "rust",
      "python",
      "lua",
      "bash",
      "json",
      "go",
      "c",
      "cpp",
      "java",
      "javascript",
      "typescript",
      "dart",
      "proto",
    }
    local to_install = vim.tbl_filter(function(p)
      return not vim.tbl_contains(installed, p)
    end, parsers)
    if #to_install > 0 then
      require("nvim-treesitter").install(to_install)
    end
  end,
}

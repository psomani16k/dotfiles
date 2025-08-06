return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
      vim.cmd('echo "Added buffer to harpoon"')
    end)
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<C-M-j>", function()
      harpoon:list():select(1)
      vim.cmd('echo "At buffer 1"')
    end)

    vim.keymap.set("n", "<C-M-k>", function()
      harpoon:list():select(2)
      vim.cmd('echo "At buffer 2"')
    end)

    vim.keymap.set("n", "<C-M-l>", function()
      harpoon:list():select(3)
      vim.cmd('echo "At buffer 3"')
    end)

    vim.keymap.set("n", "<C-M-;>", function()
      harpoon:list():select(4)
      vim.cmd('echo "At buffer 4"')
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-p>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-S-n>", function() harpoon:list():next() end)
  end
}

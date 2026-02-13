return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- defaults = {
    --     windblend = 50,
    -- },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope Find Files" })
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope Git Files" })
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Telescope Grep String" })
    end,
}

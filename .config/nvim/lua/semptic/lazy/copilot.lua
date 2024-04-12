return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      -- "zbirenbaum/copilot-cmp",
    },
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = false,
          },
        },
        -- panel = { enabled = false },
      })

      local suggestions = require("copilot.suggestion")

      vim.keymap.set('i', '<Tab>', function()
        if suggestions.is_visible() then
          suggestions.accept()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
        end
      end, { desc = "Super Tab" })

      -- require("copilot_cmp").setup({})
    end,
  }
}

return {
  {
    'numToStr/Comment.nvim',

    config = function()
      require('Comment').setup({
        ignore = '^$',
        toggler = {
          line = '<C-/>',
          block = '<C-?>',
        },
        opleader = {
          line = '<C-/>',
          block = '<C-?>',
        },
        mappings = {
          basic = true,
          extra = false,
        },
      })
    end,
  }
}

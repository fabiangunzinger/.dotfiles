return {
  -- smart commenting
  {
    'numToStr/Comment.nvim',
    version = nil,
    branch = 'master',
    config = function()
      require('Comment').setup {}
    end
  }
}

return {
  "saghen/blink.cmp",
  opts = {
    enabled = function()
      local disabled = false
      disabled = disabled or (vim.tbl_contains({ "markdown" }, vim.bo.filetype))
      disabled = disabled or (vim.bo.buftype == "prompt")
      return not disabled
    end,
  },
}

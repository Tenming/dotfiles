return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {},
  config = function ()
    require("colorizer").setup({
      filetypes = {
        "*",
        css = {mode = "background", rgb_fn = true, },
        "javascript",
        html = { mode = "foreground" },
      },
      user_default_options = { mode = "background" },
    })
  end
}
return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  { 
    "lukas-reineke/indent-blankline.nvim", 
    main = "ibl", 
    opts = {},
    config = function()
      require("ibl").setup()
    end,
  }, 
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({
                "css"; 
                "scss"; 
                "html"; 
                "javascript";
            }, 
            {
            RGB = true,
            RRGGBB = true,
            RRGGBBAA = true,
            rgb_fn = true,
            hsl_fn = true,
            css = true,
            css_fn = true,
            mode = 'background',
            })
    end,
  },
  -- {
  --   "RRethy/vim-illuminate",
  --   lazy = true,
  --   config = function()
  --     require("illuminate").configure()
  --   end,
  -- },
}

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
        {
            "L3MON4D3/LuaSnip",
            config = function(plugin, opts)
            -- include the default astronvim config that calls the setup call
            require "plugins.configs.luasnip"(plugin, opts)
            -- load snippets paths
            require("luasnip.loaders.from_vscode").lazy_load {
                   paths = {"~/.config/nvim/lua/user/snippets"} 
                }
            end,
        }
}

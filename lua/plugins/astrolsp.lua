-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      lsp_document_highlight = {
        cond = "textDocument/documentHighlight",
        {
          event = { "CursorHold", "CursorHoldI" },
          desc = "Document Highlighting",
          callback = function() vim.lsp.buf.document_highlight() end,
        },
        {
          event = { "CursorMoved", "CursorMovedI", "BufLeave" },
          desc = "Document Highlighting Clear",
          callback = function() vim.lsp.buf.clear_references() end,
        },
      },
    },
    -- Customize language server capabilities (including snippet support)
    capabilities = vim.lsp.protocol.make_client_capabilities(), -- Set up LSP capabilities table
    -- Configure language servers for `lspconfig`
    config = {
      -- HTML configuration (handle both html and djangohtml filetypes)
      html = {
        filetypes = { "html", "djangohtml" }, -- Handle both html and djangohtml
        autostart = true, -- Ensure autostart is enabled
        capabilities = vim.tbl_extend('keep', vim.lsp.protocol.make_client_capabilities(), {
          textDocument = {
            completion = {
              completionItem = {
                snippetSupport = true -- Enable snippet support
              },
            },
          },
        }),
      },
      -- Example for another language server (Lua)
      lua_ls = {
        settings = {
          Lua = {
            hint = { enable = true, arrayIndex = "Disable" },
          },
        },
      },
    },
    -- A custom flags table to be passed to all language servers
    flags = {
      exit_timeout = 5000,
    },
    -- Formatting configuration
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = { "html", "djangohtml" }, -- Allow for html and djangohtml
      },
      timeout_ms = 1000,
    },
    -- Handlers to setup language servers
    handlers = {
      function(server, opts)
        require("lspconfig")[server].setup(opts)
      end,
    },
    -- Mappings for LSP features
    mappings = {
      n = {
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client, bufnr)
            return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens
          end,
        },
      },
    },
    -- Setup language servers that should be installed
    servers = { "html", "lua_ls" },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    on_attach = function(client, bufnr)
      -- Additional custom on_attach logic
    end,
  },
}

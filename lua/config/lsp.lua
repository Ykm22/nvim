local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  cmd = { "/nix/store/7p9nvzwkh9pjxwm8i7w6y663933kinkd-pyright-1.1.354/bin/pyright-langserver", "--stdio" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})

lspconfig.omnisharp.setup({
  cmd = { "/nix/store/i0v20j9y5wkwk7y6x4fp39y2yqk3bwv3-omnisharp-roslyn-1.39.11/bin/OmniSharp" },
  -- Enables support for reading code style, naming convention and analyzer
  -- settings from .editorconfig.
  enable_editorconfig_support = true,

  -- If true, MSBuild project system will only load projects for files that
  -- were opened in the editor. This setting is useful for big C# codebases
  -- and allows for faster initialization of code navigation features only
  -- for projects that are relevant to code that is being edited. With this
  -- setting enabled OmniSharp may load fewer projects and may thus display
  -- incomplete reference lists for symbols.
  enable_ms_build_load_projects_on_demand = false,

  -- Enables support for roslyn analyzers, code fixes and rulesets.
  enable_roslyn_analyzers = false,

  -- Specifies whether 'using' directives should be grouped and sorted during
  -- document formatting.
  organize_imports_on_format = false,

  -- Enables support for showing unimported types and unimported extension
  -- methods in completion lists. When committed, the appropriate using
  -- directive will be added at the top of the current file.
  enable_import_completion = false,

  -- Specifies whether to include preview versions of the .NET SDK when
  -- determining which version to use for project loading.
  sdk_include_prereleases = true,

  -- Only run analyzers against open files when 'enableRoslynAnalyzers' is true
  analyze_open_documents_only = false,
})

lspconfig.jdtls.setup({
  cmd = { "/nix/store/lp9vxh9ba1wgchzxva4ph9s1r9vmjyf4-jdt-language-server-1.31.0/bin/jdtls" },
  -- Adjust the path above to match your actual jdtls installation path in NixOS

  -- Java-specific settings
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {
          "org.junit.Assert.*",
          "org.junit.Assume.*",
          "org.junit.jupiter.api.Assertions.*",
          "org.junit.jupiter.api.Assumptions.*",
          "org.junit.jupiter.api.DynamicContainer.*",
          "org.junit.jupiter.api.DynamicTest.*",
          "org.mockito.Mockito.*",
        },
        importOrder = {
          "java",
          "javax",
          "com",
          "org",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
    },
  },

  -- If you want to use jdtls plugins, you can specify them here
  -- init_options = {
  --   bundles = {}
  -- },

  -- Enable this if you want to use jdtls with the built-in LSP client
  capabilities = require("cmp_nvim_lsp").default_capabilities(),

  -- You can add more jdtls-specific configurations here
})

local java_home = vim.fn.expand("$JAVA_HOME")
local jdtls_path = "/nix/store/lp9vxh9ba1wgchzxva4ph9s1r9vmjyf4-jdt-language-server-1.31.0"

lspconfig.jdtls.setup({
  cmd = { jdtls_path .. "/bin/jdtls" },
  root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {
          "org.junit.Assert.*",
          "org.junit.Assume.*",
          "org.junit.jupiter.api.Assertions.*",
          "org.junit.jupiter.api.Assumptions.*",
          "org.junit.jupiter.api.DynamicContainer.*",
          "org.junit.jupiter.api.DynamicTest.*",
          "org.mockito.Mockito.*",
        },
        importOrder = {
          "java",
          "javax",
          "com",
          "org",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
    },
  },
  init_options = {
    bundles = {},
  },
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})



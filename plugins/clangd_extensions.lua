 return  {
    "p00f/clangd_extensions.nvim", -- install lsp plugin
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "clangd" }, -- automatically install lsp
      },
     setup = { extensions = {
       autoSetHints = true, 
       inlay_hints = { 
         only_current_line = false, 
         only_current_line_autocmd = "CursorHold",
         show_parameter_hints = true,
         parameter_hints_prefix = "<- ",
         other_hints_prefix = "=> ",
         max_len_align = false,
         right_align = false,
         highlight = "Comment",
         priority = 100,
       },
       ast =  {
          -- These are unicode, should be available in any font
            role_icons = {
                 type = "🄣",
                 declaration = "🄓",
                 expression = "🄔",
                 statement = ";",
                 specifier = "🄢",
                 ["template argument"] = "🆃",
            },
            kind_icons = {
                Compound = "🄲",
                Recovery = "🅁",
                TranslationUnit = "🅄",
                PackExpansion = "🄿",
                TemplateTypeParm = "🅃",
                TemplateTemplateParm = "🅃",
                TemplateParamObject = "🅃",
            },
         highlights = {detail = "Comment"}

       }
     }}
    },
}

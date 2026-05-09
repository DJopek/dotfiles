-- ~/.config/nvim/init.lua
-- Synth Wave '84 — Luis Reyes' Remix, palette extracted from
-- ~/code/dotfiles/colorpreset.itermcolors so Neovim matches the terminal.

-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------
local opt = vim.opt

opt.termguicolors    = true
opt.background       = 'dark'
opt.number           = true
opt.relativenumber   = true
opt.cursorline       = true
opt.signcolumn       = 'yes'
opt.showmatch        = true
opt.incsearch        = true
opt.hlsearch         = true
opt.ignorecase       = true
opt.smartcase        = true
opt.expandtab        = true
opt.tabstop          = 4
opt.shiftwidth       = 4
opt.softtabstop      = 4
opt.smartindent      = true
opt.wrap             = true
opt.linebreak        = true
opt.scrolloff        = 5
opt.sidescrolloff    = 8
opt.wildmenu         = true
opt.wildmode         = 'longest:full,full'
opt.laststatus       = 2
opt.mouse            = 'a'
opt.hidden           = true
opt.lazyredraw       = true
opt.updatetime       = 300
opt.splitright       = true
opt.splitbelow       = true
opt.undofile         = true

vim.g.mapleader      = ','
vim.g.maplocalleader = ','

-------------------------------------------------------------------------------
-- Palette (VS Code "Synth Wave '84 Luis Reyes Remix" theme; bg forced to iTerm)
-------------------------------------------------------------------------------
local c = {
  bg          = '#2a2139',  -- iTerm bg (forced — theme uses #262335)
  bg_alt      = '#241b2f',  -- theme sidebar background
  bg_lighter  = '#34294f',  -- theme bracket-match / line bg
  fg          = '#ffffff',  -- theme foreground
  fg_dim      = '#ffffffcc',
  comment     = '#848bbd',  -- comment
  pink        = '#ff7edb',  -- variable, properties, headings
  red         = '#fe4450',  -- entity.name, support, types, self/this
  yellow      = '#fede5d',  -- keyword, keyword.control, storage, attributes
  yellow_op   = '#fad130',  -- keyword.operator
  orange      = '#f97e72',  -- constant, numeric, regex
  coral       = '#ff8b39',  -- string.quoted
  gold        = '#f3c061',  -- general string fallback
  green       = '#72f1b8',  -- entity.name.tag, imports, parameters in calls
  cyan        = '#36f9f6',  -- entity.name.function, character.escape
  cyan_bright = '#00ccff',  -- punctuation
  light_blue  = '#2ee2fa',  -- JS/Dart numerics
  -- kept for statusline / netrw chrome (not part of editor highlighting)
  blue        = '#6d77b3',
  purple      = '#c792ea',
  magenta     = '#f92aad',
  lavender    = '#e1acff',
}

-------------------------------------------------------------------------------
-- Colorscheme
-------------------------------------------------------------------------------
vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then vim.cmd('syntax reset') end
vim.g.colors_name = 'synthwave_remix'

local function hi(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

-- Editor chrome
hi('Normal',       { fg = c.fg,      bg = c.bg })
hi('NormalNC',     { fg = c.fg,      bg = c.bg })
hi('NormalFloat',  { fg = c.fg,      bg = c.bg_alt })
hi('FloatBorder',  { fg = c.purple,  bg = c.bg_alt })
hi('LineNr',       { fg = '#495495', bg = c.bg })
hi('CursorLineNr', { fg = c.yellow,  bg = c.bg_lighter, bold = true })
hi('CursorLine',   { bg = c.bg_lighter })
hi('CursorColumn', { bg = c.bg_lighter })
hi('SignColumn',   { bg = c.bg })
hi('VertSplit',    { fg = '#495495', bg = c.bg })
hi('WinSeparator', { fg = '#495495', bg = c.bg })
hi('ColorColumn',  { bg = c.bg_alt })
hi('MatchParen',   { fg = c.yellow,  bg = '#495495', bold = true })
hi('Visual',       { bg = c.bg_lighter })
hi('Search',       { fg = c.bg,      bg = c.yellow })
hi('IncSearch',    { fg = c.bg,      bg = c.pink, bold = true })
hi('CurSearch',    { fg = c.bg,      bg = c.pink, bold = true })
hi('NonText',      { fg = '#495495' })
hi('SpecialKey',   { fg = '#495495' })
hi('Whitespace',   { fg = '#3a2f55' })
hi('Folded',       { fg = c.comment, bg = c.bg_alt })
hi('FoldColumn',   { fg = c.comment, bg = c.bg })
hi('Pmenu',        { fg = c.fg,      bg = c.bg_alt })
hi('PmenuSel',     { fg = c.bg,      bg = c.pink, bold = true })
hi('PmenuSbar',    { bg = c.bg_alt })
hi('PmenuThumb',   { bg = c.pink })
hi('WildMenu',     { fg = c.bg,      bg = c.yellow, bold = true })
hi('TabLine',      { fg = c.comment, bg = c.bg_alt })
hi('TabLineSel',   { fg = c.yellow,  bg = c.bg, bold = true })
hi('TabLineFill',  { bg = c.bg })
hi('Title',        { fg = c.pink,    bold = true })
hi('Directory',    { fg = c.purple,  bold = true })   -- matches zsh path color
hi('Question',     { fg = c.yellow })
hi('ModeMsg',      { fg = c.yellow,  bold = true })
hi('MoreMsg',      { fg = c.green })
hi('WarningMsg',   { fg = c.orange,  bold = true })
hi('ErrorMsg',     { fg = c.red,     bold = true })
hi('Error',        { fg = c.red,     bold = true })
hi('Conceal',      { fg = c.comment })

-- Statusline — mirrors zsh prompt: blue user@host, magenta path, yellow %#
hi('StatusLine',   { fg = c.blue,    bg = c.bg_alt, bold = true })
hi('StatusLineNC', { fg = c.comment, bg = c.bg_alt })
hi('User1',        { fg = c.blue,    bg = c.bg_alt, bold = true })  -- blue
hi('User2',        { fg = c.purple,  bg = c.bg_alt, bold = true })  -- path
hi('User3',        { fg = c.yellow,  bg = c.bg_alt, bold = true })  -- prompt

vim.opt.statusline = table.concat({
  '%1*', ' %n ', '%*',                                 -- buffer # (blue)
  '%2*', ' %f ', '%*',                                 -- filename (purple)
  '%3*', '%m%r%h%w ', '%*',                            -- flags (yellow)
  '%=',                                                -- right-align
  '%1*', ' %y ', '%*',                                 -- filetype
  '%2*', ' %{&fileencoding?&fileencoding:&encoding} ', '%*',
  '%3*', ' %p%% %l:%c ', '%*',                         -- position
})

-- Syntax (legacy regex highlighter — mappings ported from VS Code Synth Wave Remix theme)
hi('Comment',      { fg = c.comment, italic = true })            -- comment
hi('Constant',     { fg = c.orange })                             -- constant
hi('String',       { fg = c.coral })                              -- string.quoted (~#ff8b39)
hi('Character',    { fg = c.coral })                              -- string.quoted
hi('Number',       { fg = c.orange })                             -- constant.numeric
hi('Boolean',      { fg = c.orange })                             -- constant.language
hi('Float',        { fg = c.orange })                             -- constant.numeric

hi('Identifier',   { fg = c.pink })                               -- variable
hi('Function',     { fg = c.cyan })                               -- entity.name.function

hi('Statement',    { fg = c.yellow })                             -- keyword
hi('Conditional',  { fg = c.yellow })                             -- keyword.control
hi('Repeat',       { fg = c.yellow })                             -- keyword.control
hi('Label',        { fg = c.yellow })                             -- keyword
hi('Operator',     { fg = c.yellow_op })                          -- keyword.operator
hi('Keyword',      { fg = c.yellow })                             -- keyword
hi('Exception',    { fg = c.red,     bold = true })               -- entity.name

hi('PreProc',      { fg = c.green })                              -- C/C++ preprocessor → green
hi('Include',      { fg = c.green })                              -- import/include → green
hi('Define',       { fg = c.green })
hi('Macro',        { fg = c.green })
hi('PreCondit',    { fg = c.green })

hi('Type',         { fg = c.red })                                -- entity.name.type (class)
hi('StorageClass', { fg = c.yellow,  italic = true })             -- storage.type / storage.modifier
hi('Structure',    { fg = c.red })
hi('Typedef',      { fg = c.red })

hi('Special',       { fg = c.red })                               -- support → red
hi('SpecialChar',   { fg = c.cyan })                              -- constant.character.escape
hi('Tag',           { fg = c.green })                             -- entity.name.tag
hi('Delimiter',     { fg = c.cyan_bright })                       -- punctuation
hi('SpecialComment',{ fg = c.comment, italic = true })
hi('Debug',         { fg = c.red })

hi('Underlined', { fg = c.cyan, underline = true })
hi('Ignore',     { fg = '#495495' })
hi('Todo',       { fg = c.bg, bg = c.yellow, bold = true })

-- Diff
hi('DiffAdd',    { fg = c.green,   bg = '#1f3a2f' })
hi('DiffChange', { fg = c.yellow,  bg = '#3a3520' })
hi('DiffDelete', { fg = c.red,     bg = '#3a1f24' })
hi('DiffText',   { fg = c.pink,    bg = '#3a3520', bold = true })

-- Spell
hi('SpellBad',   { sp = c.red,     undercurl = true })
hi('SpellCap',   { sp = c.yellow,  undercurl = true })
hi('SpellRare',  { sp = c.pink,    undercurl = true })
hi('SpellLocal', { sp = c.cyan,    undercurl = true })

-- Diagnostics (built-in LSP)
hi('DiagnosticError', { fg = c.red })
hi('DiagnosticWarn',  { fg = c.yellow })
hi('DiagnosticInfo',  { fg = c.cyan })
hi('DiagnosticHint',  { fg = c.comment })
hi('DiagnosticUnderlineError', { sp = c.red,    undercurl = true })
hi('DiagnosticUnderlineWarn',  { sp = c.yellow, undercurl = true })
hi('DiagnosticUnderlineInfo',  { sp = c.cyan,   undercurl = true })
hi('DiagnosticUnderlineHint',  { sp = c.comment, undercurl = true })

-- Tree-sitter — mappings ported from VS Code Synth Wave Remix theme
hi('@comment',          { fg = c.comment, italic = true })       -- comment
hi('@string',           { fg = c.coral })                         -- string.quoted
hi('@string.escape',    { fg = c.cyan })                          -- constant.character.escape
hi('@string.regex',     { fg = c.orange })                        -- string.regexp
hi('@number',           { fg = c.orange })                        -- constant.numeric
hi('@boolean',          { fg = c.orange })                        -- constant.language
hi('@constant',         { fg = c.orange })                        -- constant
hi('@constant.builtin', { fg = c.orange })                        -- constant.language
hi('@variable',         { fg = c.pink })                          -- variable
hi('@variable.builtin', { fg = c.red, bold = true })              -- variable.language (self/this)
hi('@parameter',        { fg = c.fg, italic = true })             -- variable.parameter
hi('@function',         { fg = c.cyan })                          -- entity.name.function
hi('@function.builtin', { fg = c.cyan })                          -- support.function
hi('@function.call',    { fg = c.cyan })                          -- variable.function
hi('@function.macro',   { fg = c.cyan })                          -- inherits function color
hi('@method',           { fg = c.cyan })
hi('@method.call',      { fg = c.cyan })
hi('@keyword',          { fg = c.yellow })                        -- keyword
hi('@keyword.function', { fg = c.yellow })
hi('@keyword.return',   { fg = c.yellow })
hi('@keyword.import',   { fg = c.yellow })                        -- keyword (theme's green is JS-only)
hi('@conditional',      { fg = c.yellow })                        -- keyword.control
hi('@repeat',           { fg = c.yellow })                        -- keyword.control
hi('@operator',         { fg = c.yellow_op })                     -- keyword.operator
hi('@type',             { fg = c.red })                           -- entity.name.type (annotations like x: int)
hi('@type.builtin',     { fg = c.red })                           -- type constructors: int, float, type, dict, ... (after Python query override)
hi('@type.qualifier',   { fg = c.yellow })                        -- storage.modifier
hi('@namespace',        { fg = c.red })                           -- entity.name (module/namespace)
hi('@punctuation.bracket',  { fg = c.cyan_bright })               -- punctuation
hi('@punctuation.delimiter',{ fg = c.cyan_bright })               -- punctuation
hi('@punctuation.special',  { fg = c.yellow })                    -- punctuation.section.embedded
hi('@tag',              { fg = c.green })                         -- entity.name.tag
hi('@tag.attribute',    { fg = c.yellow })                        -- entity.other.attribute-name
hi('@tag.delimiter',    { fg = c.cyan })                          -- punctuation.definition.tag
hi('@property',         { fg = c.pink })                          -- support.type.property-name
hi('@field',            { fg = c.pink })                          -- meta.object-literal.key
hi('@constructor',      { fg = c.red })                           -- entity.name.type
hi('@attribute',        { fg = c.cyan })                          -- decorators

-- Comment keywords (requires the `comment` tree-sitter parser)
hi('@comment.todo',    { fg = c.yellow, bold = true })
hi('@comment.warning', { fg = c.orange, bold = true })
hi('@comment.note',    { fg = c.cyan,   bold = true })
hi('@comment.error',   { fg = c.red,    bold = true })

-- DONE isn't tagged by the comment grammar — match it manually.
hi('CommentDone', { fg = c.green, bold = true })
vim.api.nvim_create_autocmd({ 'BufWinEnter', 'FileType' }, {
  callback = function()
    vim.fn.matchadd('CommentDone', '\\<DONE\\>')
  end,
})

-- LSP semantic tokens — link to the matching tree-sitter groups so pyright
-- et al. don't flatten the carefully-tuned highlights above.
vim.cmd[[
  " Types
  hi link @lsp.type.function       @function
  hi link @lsp.type.method          @method
  hi link @lsp.type.variable        @variable
  hi link @lsp.type.parameter       @parameter
  hi link @lsp.type.property        @property
  hi link @lsp.type.class           @constructor
  hi link @lsp.type.struct          @constructor
  hi link @lsp.type.interface       @constructor
  hi link @lsp.type.enum            @constructor
  hi link @lsp.type.enumMember      @constant
  hi link @lsp.type.type            @constructor
  hi link @lsp.type.typeParameter   @constructor
  hi link @lsp.type.namespace       @namespace
  hi link @lsp.type.decorator       @function
  hi link @lsp.type.keyword         @keyword
  hi link @lsp.type.macro           @macro
  hi link @lsp.type.modifier        @keyword
  hi link @lsp.type.operator        @operator
  hi link @lsp.type.string          @string
  hi link @lsp.type.number          @number
  hi link @lsp.type.comment         @comment
  hi link @lsp.type.event           @function
  hi link @lsp.type.regexp          @string
  hi link @lsp.type.selfKeyword     @variable.builtin

  " Modifiers (typemod.<type>.<modifier>)
  hi link @lsp.typemod.variable.readonly         @constant
  hi link @lsp.typemod.variable.defaultLibrary   @variable.builtin
  hi link @lsp.typemod.function.defaultLibrary   @function.builtin
  hi link @lsp.typemod.class.defaultLibrary      @type.builtin
  hi link @lsp.typemod.parameter.readonly        @parameter
  hi link @lsp.typemod.method.defaultLibrary     @function.builtin
]]

-- Markdown / docs accents
vim.cmd[[
  hi link markdownH1       Title
  hi link markdownH2       Title
  hi link markdownCode     String
  hi link markdownLinkText Underlined
]]

-- Netrw (built-in browser) — matches zsh ls colors
hi('netrwDir',     { fg = c.purple, bold = true })   -- dirs in zsh-magenta
hi('netrwExe',     { fg = c.yellow, bold = true })   -- executables yellow
hi('netrwSymLink', { fg = c.cyan })
hi('netrwLink',    { fg = c.cyan })

-- Cursor color (gui only — terminal cursor is set by iTerm itself)
hi('Cursor',  { fg = c.bg, bg = c.pink })
hi('lCursor', { fg = c.bg, bg = c.pink })

-------------------------------------------------------------------------------
-- Plugins (lazy.nvim) — Treesitter rich syntax highlighting
-------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'nvim-treesitter/nvim-treesitter',
    tag = 'v0.9.3',  -- last release with the legacy `.configs.setup()` API
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'python', 'lua', 'vim', 'vimdoc', 'bash', 'json', 'yaml',
          'toml', 'markdown', 'markdown_inline', 'html', 'css',
          'javascript', 'typescript', 'tsx', 'matlab', 'comment',
        },
        auto_install = true,
        highlight = { enable = true },
        indent    = { enable = true },
      })
    end,
  },

  -- Package manager for LSP servers / linters / formatters
  { 'mason-org/mason.nvim', config = true },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = { 'mason-org/mason.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      ensure_installed = { 'pyright', 'ruff', 'lua_ls', 'matlab_ls' },
      automatic_installation = true,
    },
  },

  -- LSP client configs (real-time errors, type checking, semantic tokens)
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Python: pyright (types) + ruff (lint/format, very fast)
      vim.lsp.config('pyright', {
        settings = {
          pyright = { disableOrganizeImports = true }, -- ruff handles it
          python  = { analysis = { typeCheckingMode = 'basic' } },
        },
      })
      vim.lsp.config('ruff', {})

      -- Lua (for editing this config)
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace   = { checkThirdParty = false },
            telemetry   = { enable = false },
          },
        },
      })

      -- MATLAB
      vim.lsp.config('matlab_ls', {
        settings = {
          MATLAB = {
            installPath           = '/Applications/MATLAB_R2026a.app',
            indexWorkspace        = true,
            matlabConnectionTiming = 'onStart',
            telemetry             = false,
          },
        },
      })

      vim.lsp.enable({ 'pyright', 'ruff', 'lua_ls', 'matlab_ls' })

      -- Disable pyright's semantic tokens: they tag every builtin (range, int,
      -- float, type, ...) as "class + defaultLibrary", which collapses the
      -- cyan/red distinction we get from treesitter. Diagnostics, hover,
      -- jump-to-def etc. still work normally.
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == 'pyright' then
            client.server_capabilities.semanticTokensProvider = nil
          end
        end,
      })

      -- Diagnostic display
      vim.diagnostic.config({
        virtual_text = false,    -- no inline error text (use <leader>d to peek)
        signs        = true,
        underline    = true,
        update_in_insert = false,
        severity_sort    = true,
      })
    end,
  },
})

-------------------------------------------------------------------------------
-- Keymaps
-------------------------------------------------------------------------------
local map = vim.keymap.set
map('n', '<leader><space>', ':nohlsearch<CR>',  { silent = true, desc = 'Clear search highlight' })
map('n', '<leader>w',       ':w<CR>',           { silent = true, desc = 'Save' })
map('n', '<leader>q',       ':q<CR>',           { silent = true, desc = 'Quit' })
map('n', '<leader>e',       ':Explore<CR>',     { silent = true, desc = 'File browser' })

-- Diagnostics
map('n', '[d',         vim.diagnostic.goto_prev,  { desc = 'Prev diagnostic' })
map('n', ']d',         vim.diagnostic.goto_next,  { desc = 'Next diagnostic' })
map('n', '<leader>d',  vim.diagnostic.open_float, { desc = 'Show diagnostic' })
map('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Diagnostics → loclist' })

-- LSP buffer-local keymaps (set on attach)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local o = { buffer = ev.buf, silent = true }
    map('n', 'gd', vim.lsp.buf.definition,     o)
    map('n', 'gD', vim.lsp.buf.declaration,    o)
    map('n', 'gr', vim.lsp.buf.references,     o)
    map('n', 'gi', vim.lsp.buf.implementation, o)
    map('n', 'K',  vim.lsp.buf.hover,          o)
    map('n', '<leader>rn', vim.lsp.buf.rename, o)
    map('n', '<leader>ca', vim.lsp.buf.code_action, o)
    map('n', '<leader>f',  function() vim.lsp.buf.format({ async = true }) end, o)
  end,
})

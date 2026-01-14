return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },

  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        -- Configure ripgrep arguments for better searching
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',           -- Search hidden files
          '--follow',           -- Follow symlinks
          '--glob=!**/.git/*', -- Exclude .git directory
          '--glob=!**/.svn/*', -- Exclude .svn directory
          '--glob=!**/.hg/*',  -- Exclude .hg directory
          '--glob=!**/.DS_Store', -- Exclude .DS_Store files
          '--glob=!**/node_modules/*', -- Exclude node_modules
          '--glob=!**/.venv/*', -- Exclude Python virtual environments
          '--glob=!**/__pycache__/*', -- Exclude Python cache
          '--glob=!**/*.pyc',  -- Exclude Python compiled files
        },

        -- File ignore patterns (for file pickers)
        file_ignore_patterns = {
          "^%.git/",
          "^%.git$",
          "%.git/",
          "node_modules/",
          "%.cache",
          "%.vscode/",
          "%.idea/",
          "__pycache__",
          "%.pyc$",
          "%.pyo$",
          "%.pyd$",
          "%.so$",
          "%.dll$",
          "%.class$",
          "%.exe$",
          "%.o$",
          "%.a$",
          "%.out$",
          "%.pdf$",
          "%.zip$",
          "%.tar%.gz$",
          "%.tar$",
          "%.rar$",
          "%.7z$",
          "vendor/",
          "dist/",
          "build/",
          "target/",
          "%.lock$",
        },

        -- UI Configuration
        prompt_prefix = " 🔍 ",
        selection_caret = " ➜ ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          vertical = {
            mirror = false,
          },
          width = 0.85,
          height = 0.80,
          preview_cutoff = 120,
          flex = {
            flip_columns = 140,
          },
        },

        -- Path display
        path_display = { "truncate" },

        -- Window options
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,

        -- Preview
        set_env = { ["COLORTERM"] = "truecolor" },

        -- Mappings
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-c>"] = actions.close,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-/>"] = actions.which_key,
            ["<C-h>"] = "which_key",
            ["<esc>"] = actions.close,
          },
          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["?"] = actions.which_key,
          },
        },
      },

      pickers = {
        find_files = {
          -- Use fd if available, otherwise fall back to find
          find_command = vim.fn.executable("fd") == 1
            and { "fd", "--type", "f", "--hidden", "--follow", "--exclude", ".git", "--strip-cwd-prefix" }
            or { "rg", "--files", "--hidden", "--follow", "--glob=!**/.git/*" },
          hidden = false,  -- We handle hidden files via find_command
        },

        live_grep = {
          additional_args = function()
            return { "--hidden", "--follow", "--glob=!**/.git/*" }
          end,
          only_sort_text = true,
        },

        grep_string = {
          additional_args = function()
            return { "--hidden", "--follow", "--glob=!**/.git/*" }
          end,
        },

        buffers = {
          show_all_buffers = true,
          sort_lastused = true,
          theme = "dropdown",
          previewer = false,
          mappings = {
            i = {
              ["<c-d>"] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
        },

        git_files = {
          show_untracked = true,
        },
      },

      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    -- Load extensions
    pcall(telescope.load_extension, 'fzf')

    local builtin = require('telescope.builtin')

    -- Primary find keymaps following <leader>f group
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find recent files' })
    vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Find commands' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find keymaps' })
    vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Find string under cursor' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find diagnostics' })
    vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Find marks' })

    -- Git-specific searches (only search tracked files)
    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Git files' })
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
    vim.keymap.set('n', '<leader>gC', builtin.git_bcommits, { desc = 'Git buffer commits' })
    vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })

    -- Quick access shortcuts
    vim.keymap.set('n', '<leader><space>', builtin.find_files, { desc = 'Find files (quick)' })
    vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Search in project' })
    vim.keymap.set('n', '<leader>,', builtin.buffers, { desc = 'Switch buffer' })

    -- Legacy keybinds for muscle memory
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<C-g>', builtin.live_grep, { desc = 'Live grep' })
  end
}

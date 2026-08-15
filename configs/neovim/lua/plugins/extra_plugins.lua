return {
  {
    "TaDaa/vimade",
    -- Loads when you have more than one window split open to save performance
    event = "WinNew",
    config = function()
      -- Custom Vimade configuration can go here if needed
    end,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    -- Native Vimscript plugin, lazy loading via keys ensures fast startup
    keys = {
      { "<C-n>", desc = "Find Under (Visual Multi)" },
      { "<C-Down>", desc = "Add Cursor Down" },
      { "<C-Up>", desc = "Add Cursor Up" },
    },
    init = function()
      -- Vimscript global variables must be configured in the "init" stage
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
      }
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Go to the previous pane" },
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Got to the left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Got to the down pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Got to the up pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Got to the right pane" },
    },
  },
  {
    "PedramNavid/dbtpal",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    ft = {
      "sql",
      "md",
      "yaml",
    },
    keys = {
      { "<leader>drf", "<cmd>DbtRun<cr>" },
      { "<leader>drp", "<cmd>DbtRunAll<cr>" },
      { "<leader>dtf", "<cmd>DbtTest<cr>" },
      { "<leader>dm", "<cmd>lua require('dbtpal.telescope').dbt_picker()<cr>" },
    },
    config = function()
      require("dbtpal").setup({
        path_to_dbt = "dbt",
        path_to_dbt_project = "",
        path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),
        include_profiles_dir = true,
        include_project_dir = true,
        include_log_level = true,
        extended_path_search = true,
        protect_compiled_files = true,
        pre_cmd_args = {},
        post_cmd_args = {},
      })
      require("telescope").load_extension("dbtpal")
    end,
  },
}

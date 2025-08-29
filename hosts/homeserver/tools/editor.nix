{ nixvim, ... }:

{
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    clipboard.register = "unnamedplus";

    globals.mapleader = " ";

    opts = {
      updatetime = 100;

      number = true;
      relativenumber = true;
      scrolloff = 4;

      autoindent = true;
      expandtab = true;
      smartindent = true;

      ignorecase = true;
      incsearch = true;
      smartcase = true;
      wildmode = "list:longest";

      swapfile = false;
      undofile = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        options.silent = true;
        action = "<cmd>Neotree toggle<CR>";
      }
      {
        mode = "n";
        key = "<leader>gg";
        options.silent = true;
        action = "<cmd>LazyGit<CR>";
      }
      {
        mode = "n";
        key = "<leader>qq";
        options.silent = true;
        action = "<cmd>qa<CR>"; # exit everything
      }
      {
        mode = "n";
        key = "<C-h>";
        options.silent = true;
        action = "<C-w>h";
      }
      {
        mode = "n";
        key = "<C-l>";
        options.silent = true;
        action = "<C-w>l";
      }
      {
        mode = "n";
        key = "<S-l>";
        options.silent = true;
        action = "<cmd>bnext<CR>";
      }
      {
        mode = "n";
        key = "<S-h>";
        options.silent = true;
        action = "<cmd>bprevious<CR>";
      }
      {
        mode = "n";
        key = "<leader>bd";
        options.silent = true;
        action = "<cmd>Bdelete<CR>";
      }
    ];

    plugins = {
      # UI
      lualine.enable = true;
      neo-tree.enable = true;
      web-devicons.enable = true;

      bufferline = {
        enable = true;

        settings = {
          options = {
            offsets = [{
              filetype = "neo-tree";
              text = "Nvim Tree";
              separator = true;
              text_align = "left";
            }];
          };
        };
      };

      # To delete the buffers
      bufdelete.enable = true;

      # Git
      lazygit.enable = true;

      # Session
      auto-session = {
        enable = true;
        autoLoad = true;

        settings = {
          auto_save = true;
          auto_restore = true;
          cwd_change_handling = true;
          single_session_mode = true;
        };
      };

      # LSP stuff
      lsp-format.enable = true;

      lspkind = {
        enable = true;
        cmp.enable = true;
      };

      lsp = {
        enable = true;
        inlayHints = true;

        servers = {
          jsonls.enable = true;
          marksman.enable = true;
          nil_ls.enable = true;
          nixd.enable = true;
          yamlls.enable = true;
        };
      };

      # Nix Stuff
      nix.enable = true;
      none-ls = {
        enable = true;
        sources.formatting.nixfmt.enable = true;
      };
    };
  };
}

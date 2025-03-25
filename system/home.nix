{
  config,
  pkgs,
  inputs,
  ...
}: {
  # This file contains very basic attributes and fields.
  # Specific configuration/package installation can be found in the following .nix files...
  imports = [
    inputs.nvf.homeManagerModules.default

    ./packages/dev-tools.nix # Lanugages + LSPs
    ./packages/utils.nix # UNIX Utilities
    ./packages/apps.nix # Standalone application

    ./modules/hyprland.nix # Hyprland & its numerous tools
    ./modules/terminal.nix # Terminal config
    ./modules/nvf.nix # Neovim config
  ];

  home.username = "zsuper";
  home.homeDirectory = "/home/zsuper";

  # Manages dotfiles by symlinking at build time
  home.file = {
    ".config/nvim/init.lua".source = ../nvim/init.lua;
    ".config/nvim/lua".source = ../nvim/lua;
    ".config/hypr".source = ../hypr;
    ".config/wofi".source = ../wofi;
    ".config/yazi".source = ../yazi;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11"; # Don't change this probably
}

# Dotfiles

This repository contains the dot and nix files that build into my system. Instructions on how to reproduce and credits are below.

## Previews

#### Hyprlock (based on Catppuccin)
![Hyprlock (based on Catppuccin)](./assets/preview/hyprlock.png)

#### Hyprland tiling
![Hyprland tiled Fish terminals](./assets/preview/hyprland-tiling.png)

#### Hyprpanel
![Hyprpanel](./assets/preview/hyprpanel.png)

#### Wofi
![Wofi](./assets/preview/wofi.png)

#### Yazi
![Yazi](./assets/preview/yazi.png)

## Directory Structure

The `system` directories contain `.nix` files for building my system. Note that `hardware-configuration.nix` is automatically generated by your system if using NixOS.

## Building

Both the system and home-manager configurations are built and managed through Nix Flakes.

To build, first clone the repo:
```console
git clone git@github.com:piyushkumbhare/dotfiles.git
```

### System

Granted you have flake support enabled in NixOS, you can just run the standard rebuild command but with the flake argument:
```console
sudo nixos-rebuild switch --flake ./dotfiles/system
```

## Credits

I am not a creative person lol. Here are the links I took some configs or inspiration from:

- [wofi](https://github.com/7KIR7/dots/tree/main)
- [hyprpanel](https://github.com/Jas-SinghFSU/HyprPanel)
- [hyprlock](https://github.com/catppuccin/hyprlock)

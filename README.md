# dotfiles

# TODO: CLEAN THIS UPPP!!!

## Info
A collection of all of my essential dotfiles. For easy installation and access.

Using [Dotbot](https://github.com/anishathalye/dotbot) for installation.
Inspiration from [vsund](https://github.com/vsund/dotfiles).

## Dependencies
* general
	* `python`
	* `git`

## Installation
```bash
git clone --recursive https://github.com/ijan1/dotfiles dotfiles && cd dotfiles
./install-profile workstation # for a general configuration
./install-standalone <config(s)> # for specific configurations
```

## Contents

### Profiles
```
meta/profiles/
|- server
 └ -| zsh
   -| vim
   -| p10k
|- workstation
 └ -| vim
   -| i3
   -| alacritty
   -| polybar
   -| pywal
   -| flameshot
   -| rofi
   -| mpd
   -| ncmpcpp
   -| scripts
   -| redshift
   -| xbindkeys
   -| x11
   -| zsh
   -| p10k
```

### Configuration files
```
meta/configs/
|- alacritty.yaml
|- flameshot.yaml
|- i3.yaml
|- mpd.yaml
|- ncmcpp.yaml
|- p10k.yaml
|- polybar.yaml
|- pywal.yaml
|- redshift.yaml
|- rofi.yaml
|- scripts.yaml
|- vim.yaml
|- x11.yaml
|- xbindkeys.yaml
|- zsh.yaml
```


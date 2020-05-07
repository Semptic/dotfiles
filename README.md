# Dotfiles

## Setup

To get the dofiles working you need to run following commands:

1) Clone the repository
```
git clone --recursive --bare git@github.com:Semptic/dotfiles.git ~/.dotfiles.git
```
2) Check it out
```
git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME checkout
```
3) Reload your fish shell
```
fish
```
4) Get all the submodules
```
dotfiles submodule update --init --recursive
```
5) Don't show untracked files
```
dotfiles config --local status.showUntrackedFiles no
```
6) Install vim plugins: Open vim and run `:PluginInstall`

## Software

* i3wm
* polybar
* alacritty
* tmux
* fish
* oh-my-fish
* Fira Code Nerd Font
* Network Manager
* Network Manager Applet
* gnome keyring (See [PAM](https://wiki.archlinux.org/index.php/GNOME/Keyring#PAM_method) to unlock on login)
* vim (neovim)
* pavucontrol
* i3-gnome

## Misc

### Compose Key

To enable the compose key on caps run `setxkbmap -option compose:caps`

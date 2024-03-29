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
6) Install fish plugins
```fish
fundle install
```

7) Install vim plugins: Open vim and run `:PluginInstall`

8) Install tmux plugins: Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin.


## Software

* i3wm
* polybar
* alacritty
* tmux
* fish
* oh-my-fish
* Fira Code Nerd Font
* DejaVu Mono Sans Font
* Network Manager
* Network Manager Applet
* gnome keyring (See [PAM](https://wiki.archlinux.org/index.php/GNOME/Keyring#PAM_method) to unlock on login)
* vim (neovim)
* pavucontrol
* i3-gnome

## i3-gnome

To make it work properly you need also to disable the desktop with `gsettings set org.gnome.gnome-flashback desktop false`

## Misc

### Compose Key

To enable the compose key on caps run `setxkbmap -option compose:caps`

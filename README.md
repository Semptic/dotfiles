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
6) Install [fihser](https://github.com/jorgebucaran/fisher) and then [tide](https://github.com/IlanCosman/tide)

7) Install tmux plugins: Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin.


## Software

* alacritty
* tmux
* fish
* Fira Code Nerd Font
* Meslo Nerd Font patched for Powerlevel10k
* neovim

## Misc

### Compose Key

To enable the compose key on caps run `setxkbmap -option compose:caps`

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






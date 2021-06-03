# dotfiles
Dotfiles

## Setup
Go to [Atlassian's guide on storing dotfiles](https://www.atlassian.com/git/tutorials/dotfiles) for more info.

Starting from scratch:
```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

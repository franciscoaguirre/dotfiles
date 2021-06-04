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

### Getting vim to work

- Download Plug (vim plugin manager) from [its repository](https://github.com/junegunn/vim-plug) and install it
- Open vim (will throw some errors since you haven't installed the plugins yet) and run `:PlugInstall`
- You will still get errors because of [coc](https://github.com/neoclide/coc.nvim) if you don't have Node installed

### Things you may want to install

- [Nodenv](https://github.com/nodenv/nodenv-installer#nodenv-installer)
- [rustup](https://rustup.rs/)

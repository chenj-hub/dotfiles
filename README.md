# dotfiles setup 

## Setup
```sh
git init --bare $HOME/.dotfiles
alias d='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
d remote add origin @git_link@
```

## Replication
```sh
git clone --separate-git-dir=$HOME/.dotfiles @git_link@ dotfiles-tmp
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
rm -r dotfiles-tmp
```

## Configuration
```sh
d config status.showUntrackedFiles no
d remote set-url origin @git_link@
```

## Usage Example
```sh
d status
d add .gitconfig
d commit -m 'Add gitconfig'
d push
```

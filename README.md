# dotfiles setup 

## Setup
```sh
git init --bare $HOME/.dotfiles
alias dot='git --git-dir=$HOME/.-dotfiles/ --work-tree=$HOME'
config remote add origin [git link]
```

## Replication
```sh
git clone --separate-git-dir=$HOME/.dotfiles https://gitlab.com/chenj-lab/dotfiles.git dotfiles-tmp
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
rm -r dotfiles-tmp
```

## Configuration
```sh
dot config status.showUntrackedFiles no
dot remote set-url origin [git link]
```

## Usage Example
```sh
dot status
dot add .gitconfig
dot commit -m 'Add gitconfig'
dot push
```

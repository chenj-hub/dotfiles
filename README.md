# dotfiles setup 

## Setup
```sh
git init --bare $HOME/.dotfiles
alias config='git --git-dir=$HOME/.-dotfiles/ --work-tree=$HOME'
config remote add origin [git link]
```

## Replication
```sh
git clone --separate-git-dir=$HOME/.dotfiles https://gitlab.com/kaijiak/dotfiles.git dotfiles-tmp
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
rm --recursive dotfiles-tmp
```

## Configuration
```sh
config config status.showUntrackedFiles no
config remote set-url origin [git link]
```

## Usage Example
```sh
config status
config add .gitconfig
config commit -m 'Add gitconfig'
config push
```

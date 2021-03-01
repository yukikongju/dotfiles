# Dotfiles

Keeping track of my Dotfiles by using symlink

## Table of Contents

1. Generating Symbolic Links

## Generating Symbolic Links

We want to keep our .dotfiles in two places: one in this directory and one in
our ~/<User> directory using a symbolic links for each of the dotfiles.

#### Step 1: Enable Symbolic Links on Git Bash

For the symbolic links to work, you must enable symbolic links on your Git Bash.
This step can be done two ways:

Option 1: Reinstall Git Bash and allow Symbolic Links
Option 2: Run Git Bash as admint and run the following command before executing sym link

```
export MSYS=winsymlinks:nativestrict
```

For more information: https://github.community/t/git-bash-symbolic-links-on-windows/522/11

#### Step 2: Create the symbolic links

In your ~/<User> directory, execute:

```
ln -s ~/.dotfiles/.vimrc ~/.vimrc
```

This will create a new symbolic link by copying the file in the first path to the
second path

#### Alternative: Initalizing all dotfiles from shell script

[todo]

## Ressources

- [ ] Dotfiles Management by Fireship: https://www.youtube.com/watch?v=r_MpUP6aKiQ&t=510s

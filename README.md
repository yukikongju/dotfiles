# Dotfiles

Keeping track of my Dotfiles by using symlink

## Table of Contents

1. [Usage](#usage)
2. [Troubleshooting](#troubleshooting)

## [Usage](#usage)

#### Step 0: Clone this repository in your $HOME directory

    ```
    git clone https://github.com/yukikongju/dotfiles
    ```

#### Step 1: Enable Symbolic Links on Git Bash

For the symbolic links to work, you must enable symbolic links on your Git Bash.
This step can be done two ways:

Option 1: Reinstall Git Bash and allow Symbolic Links
Option 2: Run Git Bash as admint and run the following command before executing sym link

```
export MSYS=winsymlinks:nativestrict
```

For more information: https://github.community/t/git-bash-symbolic-links-on-windows/522/11

#### Step 2: Generate Symbolic Links from Directory

In your $HOME directory, execute:

```
./<...>/.dotfiles/init_symbolic_links.sh
```

## Troubleshooting

#### Python dll missing

Option 1: We need to add the dll to the system path
Option 2: Update all Bundles to see if patch has been pushed

More help: https://github.com/pyinstaller/pyinstaller/issues/4996

## Ressources

- [x] Dotfiles Management by Fireship: https://www.youtube.com/watch?v=r_MpUP6aKiQ&t=510s
- [x] Splitting .vimrc file: https://vi.stackexchange.com/questions/5441/is-it-possible-and-useful-to-split-vimrc
- [x] Enabling Symbolic Links in Git Bash: https://github.community/t/git-bash-symbolic-links-on-windows/522/11

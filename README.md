## dotfiles

Simple environment for working as web developer

### What's included

This environment helps with working with these tools/languages:

- zplug
- git
- vscode
- Javascript/React/TS
- starship.rs

Other utility tools include:

- [asdf](https://github.com/asdf-vm/asdf) -- manages languages (replaces rvm, nvm)
- [autojump](https://github.com/wting/autojump) -- easily jump to directories
- [fzf](https://github.com/junegunn/fzf) -- fuzzy finder for the terminal

### Installation

- clone the repo anywhere in your system
- cd into project
- run `make`

### Make it your own

The entry point is the `Makefile` and custom tools can be included via homebrew in
the `Brewfile`

Remember to replace the `.gitconfig` with your information. Use this as an example and use the [template](https://github.com/tanmdoan/dotfiles-primer) to start building your dotfiles.

### Uninstall

- under construction

### Future improvements

- run `bin/uninstall`
- extract karabiner to script

### Trouble shooting

Inspiration came from ## athal7's dotfiles

.DEFAULT_GOAL := install

dotfiles =      .asdfrc \
				.default-npm-packages \
				.gitconfig \
				.gitignore_global \
				.prettierrc \
				.tool-versions \
				.zshrc \

install: symlink packages shell languages other

echo.%:
	@echo "\n`tput smso`Building $*`tput rmso`"

symlink: echo.symlink
	@for file in $(dotfiles); do \
		rm -rf ~/$$file ;\
		ln -s $(shell pwd)/$$file ~/$$file ;\
	done

packages: echo.packages
	brew bundle

shell: echo.shell # remove this if you're on a new laptop and don't need to switch from bash to zsh
	/usr/local/opt/fzf/install

languages: echo.languages
	asdf install

# macos only <delete the example below> 
other: echo.other
	@if [ "$(uname)" == "Darwin" ]; then \
	defaults write com.apple.screencapture location ~/Downloads;killall SystemUIServer ;\
  defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder ;\
	fi
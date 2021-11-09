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

shell: echo.shell
	bin/shell
	
languages: echo.languages
	bin/languages

other: echo.other
	@if [ "$(uname)" == "Darwin" ]; then \
	defaults write com.apple.screencapture location ~/Downloads;killall SystemUIServer ;\
	defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder ;\
	fi
	rm -rf ~/.config/karabiner/karabiner.json ;\
	ln -s $(shell pwd)/karabiner.json ~/.config/karabiner/karabiner.json
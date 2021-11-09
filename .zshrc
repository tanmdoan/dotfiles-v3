#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
  [ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

# zsh
  export ZPLUG_HOME=/usr/local/opt/zplug
  source $ZPLUG_HOME/init.zsh
  HYPHEN_INSENSITIVE=true
  COMPLETION_WAITING_DOTS=true

# plugins
  fpath=(/usr/local/share/zsh/site-functions $fpath)
  zplug "plugins/autojump", from:oh-my-zsh
  zplug "plugins/docker", from:oh-my-zsh
  zplug "plugins/osx", from:oh-my-zsh
  zplug "dracula/zsh", as:theme

  if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
  fi
  zplug load

# shell functions
  fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
      BUFFER="fg"
      zle accept-line
    else
      zle push-input
      zle clear-screen
    fi
  }
  zle -N fancy-ctrl-z
  bindkey '^Z' fancy-ctrl-z

  function move-last-download {
    local download_dir="${HOME}/Downloads/"
    local last_download="$(ls -t ${download_dir} | head -1)"
    local destination_file="${PWD}/${1:-${last_download}}"

    echo "MV: ${download_dir}${last_download}"
    echo "TO: ${destination_file}"

    mv "${download_dir}${last_download}" "${destination_file}"
  }

  function killports () {
    for port in "$@"; do
      pid=$(lsof -i tcp:$port -t)

      if [[ $pid ]]; then
        kill -9 $pid
        echo "killed port: $port"
      else
        echo "No proccess matching port: $port"
      fi
    done
  }

# git aliases
  alias gap='git add -p'
  alias gnap='git add -N --ignore-removal . && gap'
  alias glp='git log -p'
  alias glg='git log --graph --oneline --decorate --color --all'
  alias gb='git branch'
  alias gc='git commit -v'
  alias gca='git commit -a -v'
  alias gcl='git clean -f -d'
  alias gd='git diff'
  alias gdc='git diff --cached'
  alias gdh='git diff HEAD'
  alias gl='git pull'
  alias glod='git log --graph --pretty="%Cgreen%h%Creset%Cblue%d%Creset %Cred%an%Creset: %s"'
  alias gp='git push'
  alias gpr='git pull --rebase'
  alias gst='git status'
  alias gr='git rebase'
  alias grc='git rebase --continue'
  alias gra='git rebase --abort'
  alias gco='git checkout'
  alias reset-authors='git commit --amend --reset-author -C HEAD'
  
# version management
  source /usr/local/opt/asdf/asdf.sh
  export PATH="$HOME/.asdf/shims:$PATH"

# docker
  alias d="docker"
  alias dc="docker-compose"
  alias dcr="docker-compose run --rm"
  alias docker-clean="docker system prune"

# mac only aliases
  alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# secrets file
  source ~/.secrets

# starship
  eval "$(starship init zsh)"

# fzf
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vmware k8
  (( $+commands[infractl] )) && source <(infractl env export)

# bun
  export BUN_INSTALL="/Users/tandoan/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
  [ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
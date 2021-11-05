# zsh
  export ZPLUG_HOME=/usr/local/opt/zplug
  source $ZPLUG_HOME/init.zsh
  HYPHEN_INSENSITIVE=true
  COMPLETION_WAITING_DOTS=true

# plugins
  fpath=(/usr/local/share/zsh/site-functions $fpath)
  zplug "plugins/autojump", from:oh-my-zsh
  # zplug "dracula/zsh", as:theme

  if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
  fi
  zplug load

# version management
  source /usr/local/opt/asdf/asdf.sh
  export PATH="$HOME/.asdf/shims:$PATH"

# go
  export GOPATH="$HOME/go"
  export PATH="$HOME/go/bin:$PATH"

# docker
  alias d="docker"
  alias dc="docker-compose"
  alias dcr="docker-compose run --rm"
  alias docker_cleanup="docker system prune"
  
# aws
  export PATH="/usr/local/opt/awscli@1/bin:$PATH"

# secrets file
  source ~/.secrets
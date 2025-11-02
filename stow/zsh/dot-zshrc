#!/usr/bin/env zsh

# If you come from bash you might have to change your $PATH.
# PATH=$HOME/bin:/usr/local/bin:$PATH

PATH="$HOME/bin:/usr/local/bin:/usr/local/opt/make/libexec/gnubin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  npm
  # react-native
  # thefuck
  git
  bundler
  # dotenv
  # macos
  # rake
  # rbenv
  # ruby
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


export EDITOR='nvim'
export REACT_EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# eval $(thefuck --alias)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



export PATH="$HOME/.cargo/bin:$PATH"


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#95a5a6"

source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme spaceship-prompt/spaceship-prompt

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle 'wfxr/forgit@main'

#tmux
antigen bundle thewtex/tmux-mem-cpu-load


# Tell Antigen that you're done.
antigen apply

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"
# Changes the ulimit limits.
ulimit -Sn 4096      # Increase open files.
ulimit -Sl unlimited # Increase max locked memory.
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PYTHONPATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:/opt/local/lib/python2.7/site-packages:${PYTHONPATH}

alias vim='nvim'

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/opt/nvim-macos-x86_64/bin"


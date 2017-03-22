# Teladoc ENV
source $HOME/.teladoc_env.zsh

# Some secrety things
source $HOME/.keys.zsh

# My ENV
export PATH=$PATH:$HOME/bin
export EDITOR='nvim'
export MSF_DATABASE_CONFIG=/usr/local/share/metasploit-framework/config/database.yml
source $HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh
source "`brew --prefix`/etc/grc.bashrc"
export PATH="$PATH:`yarn global bin`"

# Begin Antigen Setup
source $HOME/.antigen/src/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme jnrowe

antigen apply
# End Antigen Setup

# load RBENV
eval "$(rbenv init -)"

# aliases
alias -g sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias zshrc="nvim $HOME/.zshrc"
alias vpn="sudo openconnect secureconnect.teladoc.com --csd-user=apaxton --csd-wrapper=$HOME/.cisco/wrapper.sh --user=apaxton@teladoc.com"
eval "$(thefuck --alias)"
alias rake="noglob bundle exec rake"
alias be="bundle exec" 
alias gmm="git stash && git fetch origin && git merge origin/master && git stash pop"
alias nvimrc="nvim $HOME/.config/nvim/init.vim"
alias dotfile="$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias shakes="${HOME}/bin/shakes.py"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

pokedex $(( ( RANDOM % 150 )  + 1 ))

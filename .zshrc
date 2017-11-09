# Teladoc ENV
source $HOME/.teladoc_env.zsh

# tiny care term
source $HOME/.tinycare.zsh

# Some secrety things
source $HOME/.keys.zsh

# My ENV
export PATH=$PATH:$HOME/bin
export EDITOR='nvim'
export MSF_DATABASE_CONFIG=/usr/local/share/metasploit-framework/config/database.yml
source "`brew --prefix`/etc/grc.bashrc"
export PATH="$PATH:`yarn global bin`"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

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
alias zshrc='nvim $HOME/.zshrc'
alias vpn="sudo openconnect secureconnect.teladoc.com --csd-user=apaxton --csd-wrapper=$HOME/.cisco/wrapper.sh --user=apaxton@teladoc.com --servercert sha256:4fb300cdcff6915d60b69395e017b3c9e2d0b8323425f8b9f13a60c3dd773b10"
eval "$(thefuck --alias)"
alias rake="noglob bundle exec rake"
alias be='title ${PWD##*/} && bundle exec' 
alias gmm="git stash && git fetch origin && git merge origin/master && git stash pop"
alias nvimrc='nvim $HOME/.config/nvim/init.vim'
alias dotfile="$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias shakes="${HOME}/bin/shakes.py"
alias nvim='title ${PWD##*/} && nvim'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

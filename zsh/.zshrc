export ZSH="$HOME/.oh-my-zsh"
export GPG_TTY=$(tty)

ZSH_THEME="caio"

plugins=(git z colored-man-pages fzf colorize)
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.envs ] && source ~/.envs

# alias k="kubectl"
# alias t="task"

alias update='sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean && sudo snap refresh --list'

# tmux on startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ];
then
  exec tmux
fi

# nested tmux over ssh
# if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
#  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
# fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#source /usr/share/nvm/init-nvm.sh

tmux source ~/.tmux.conf

export GOPATH=/home/$USER/go
export PATH=$PATH:/home/$USER/.local/bin
export PATH=$PATH:$GOPATH/bin
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

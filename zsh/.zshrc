export ZSH="$HOME/.oh-my-zsh"
export GPG_TTY=$(tty)
ZSH_THEME="caio"

plugins=(git z colored-man-pages fzf archlinux colorize)
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.envs ] && source ~/.envs

unalias gr # created by 'git' plugin. Originally aliases to 'git remote'.
unalias grm # created by 'git' plugin. Originally aliases to 'git rm'.
_gb() {
    local _gb_base=$(git remote get-url origin \
                        | sed -E 's/.*(@|\/\/)(.*)\.git/\2/' \
                        | sed 's/:/\//g');
    if [[ "$_gb_base" == "" ]]; then
        return 1;
    fi
    _gh_url="https://$_gb_base";
}
_gtgh() { xdg-open "$_gh_url/$1"; unset _gh_url; }
gr() { _gb && _gtgh } # Go to Repository
gri() { _gb && _gtgh "issues" } # Go to Repository Issues
grin() { _gb && _gtgh "issues/new/choose" } # Go to Repository Issues for
                                            # creating a New one
grm() { _gb && _gtgh "milestones" } # Go to Repository Milestones
grr() { _gb && _gtgh "releases" }
grnp() {
    BRANCH_NAME=$(git symbolic-ref HEAD | sed 's/refs\/heads\///g')
    _gb && _gtgh "compare/$BRANCH_NAME?expand=1"
}

alias dcr='docker-compose run --rm $@'
alias dce='docker-compose exec'
alias dcup='docker-compose up'
alias dcupd='docker-compose up -d'
alias dcp='docker-compose pull $@'
alias dsa='docker ps -q | xargs docker stop'
alias dclf='docker-compose logs -f'
alias k="kubectl"
alias t="task"
# alias ls="ls -latch"

alias week='date +%V'
alias y="yay"
# tmux on startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# nested tmux over ssh
# if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
#  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
# fi

#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /usr/share/nvm/init-nvm.sh

tmux source ~/.tmux.conf

export GOPATH=/home/$USER/go
export PATH=$PATH:/home/$USER/.local/bin
export PATH=$PATH:$GOPATH/bin

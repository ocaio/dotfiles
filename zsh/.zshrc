export ZSH="/home/celias/.oh-my-zsh"
ZSH_THEME="caio"

plugins=(git zsh-z colored-man-pages zsh-syntax-highlighting fzf)
source $ZSH/oh-my-zsh.sh

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

# tmux on startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

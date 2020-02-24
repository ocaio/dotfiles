# Caio
# Based on Vito's theme, Geometry and TerminalParty
# vito's theme: https://github.com/victorgama/dotfiles/blob/master/zsh/.oh-my-zsh/themes/vito.zsh-theme
# geometry: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/geometry.zsh-theme
# avit:     https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/terminalparty.zsh-theme

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=""

prompt_vi_git_status() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    if test -z "$(git status --porcelain --ignore-submodules)"; then
      #status_color="%F{242}"
      STATUS_ICON="%F{green}✓%f"
    else
      #status_color="%F{005}"
      STATUS_ICON="%F{red}⨯%f"
    fi
    #echo "$status_color($(git_prompt_info):$(prompt_vi_commit_time)$status_color)"
    echo "%F{blue}($(git_prompt_info))%f $STATUS_ICON"
  else
    echo "%F{white}"
  fi
}

prompt_vi_show_machine_name() {
  if [ -v SSH_CLIENT ] ; then
    echo " %F{blue}%m%f"
  fi
}


#PROMPT="%(?,%F{242},%F{red}) ▲ %F{white}%f"
PROMPT="%(?,%F{242},%F{red}) → %F{white}%f"
RPS1=%F{yellow}'%2~%f $(prompt_vi_git_status)%f$(prompt_vi_show_machine_name)'

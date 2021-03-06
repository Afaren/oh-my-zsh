# Based on the great ys theme (http://ysmood.org/wp/2013/03/my-ys-terminal-theme/)

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# VCS
YS_VCS_PROMPT_PREFIX=" %{$fg[green]%}("
YS_VCS_PROMPT_SUFFIX=""
YS_VCS_PROMPT_DIRTY=") %{$fg[red]%}✖︎%{$reset_color%}"
YS_VCS_PROMPT_CLEAN=")"

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# Prompt format: \n [USER@MACHINE:DIRECTORY] (BRANCH) STATE [TIME] \n $

PROMPT="%{$terminfo[bold]$fg[white]%}╭─%{$fg[green]%}%n@$(box_name):\
$fg[blue]%}${current_dir}%{$fg[blue]%}]%{$reset_color%}\
${git_info} \
%{$terminfo[bold]$fg[white]%}[%*]
"


if [[ "$USER" == "root" ]]; then
PROMPT="
$PROMPT%{$terminfo[bold]$fg[red]%}# %{$reset_color%}"
else
PROMPT="
$PROMPT%{$terminfo[bold]$fg[white]%}╰─➤ %{$reset_color%}"
fi

# purple username
username() {
   echo "%{$FG[green]%}%n%{$reset_color%}"
}

# current directory
directory() {
   echo "%B%{$FG[010]%}%~%{$reset_color%}%b" 
}

# current time with milliseconds
current_time() {
   echo "%B%*%b"
}

# git info
git_info() {
    echo "%{$FG[000]%}$(git_prompt_info)%{$reset_color%}"
}

conda_info() {
    echo "%{$FG[000]%}%B%{$BG[012]%}$CONDA_ENV%{$reset_color%}%b%{$reset_color%}"
}
# User symbol
user_symbol() { 
    echo "$FG[white]漏"
}

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX="%B%{$BG[011]%}  "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}%b"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# putting it all together
PROMPT='$(conda_info)$(git_info) $(directory) $(user_symbol) '
RPROMPT='$(current_time)'

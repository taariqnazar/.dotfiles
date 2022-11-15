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
   echo "%B%{$FG[010]%}[%*]%{$reset_color%}%b"
}

# git info
git_info() {
    echo "$(git_prompt_info)"
}

conda_info() {
    echo "$CONDA_ENV"
}
# User symbol
user_symbol() { 
    echo "%B%{$FG[001]%}->%{$reset_color%}"
}

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX=" %B%{$FG[011]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%b"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# putting it all together
PROMPT='$(directory)$(git_info)$(conda_info)
$(user_symbol) '
RPROMPT='$(current_time)'

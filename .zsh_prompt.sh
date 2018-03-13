function precmd {
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))

    ###
    # Truncate the path if it's too long.

    PR_FILLBAR=""
    PR_PWDLEN=""

    local promptsize=${#${(%):--(%n@%m)---()-}}
    local pwdsize=${#${(%):-%~}}
    
    if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
        ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    else
        PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
    fi
}

setprompt () {
    autoload -U colors
    colors
    setopt prompt_subst


    # See if we can use extended characters.
    typeset -A altchar
    set -A altchar ${(s..)terminfo[acsc]}
    PR_SET_CHARSET="%{$terminfo[enacs]%}"
    PR_SHIFT_IN="%{$terminfo[smacs]%}"
    PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
    PR_HBAR=${altchar[q]:--}
    PR_ULCORNER=${altchar[l]:--}
    PR_LLCORNER=${altchar[m]:--}
    PR_LRCORNER=${altchar[j]:--}
    PR_URCORNER=${altchar[k]:--}

    PROMPT='
$PR_SET_CHARSET$PR_SHIFT_IN$PR_ULCORNER$PR_HBAR\
$PR_SHIFT_OUT(%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%})$PR_SHIFT_IN\
${(e)PR_FILLBAR}$PR_HBAR$PR_SHIFT_OUT(\
$PR_PWDLEN%{$fg[magenta]%}%~%{$reset_color%})$PR_SHIFT_IN$PR_HBAR$PR_URCORNER\

$PR_LLCORNER$PR_HBAR$PR_SHIFT_OUT$(git_super_status)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT '

    RPROMPT=' $PR_SHIFT_IN$PR_HBAR$PR_HBAR$PR_SHIFT_OUT\
(%(?.\
%{$fg[green]%}♥%{$reset_color%}.\
%{$fg[red]%}%?%{$reset_color%}))$PR_SHIFT_IN$PR_HBAR$PR_LRCORNER$PR_SHIFT_OUT$PR_NO_COLOUR'

}

setprompt


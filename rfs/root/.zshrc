#
# ~/.zshrc
#

#########################################################
# シェル設定
#########################################################

# コマンド履歴
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# prompt
export PS1="%n@%m %1~ %# "

#########################################################
# エイリアス
#########################################################

alias cls="clear"
alias python="python3"
alias pip="pip3"
alias ll="ls -lha"

#########################################################
# 各種ソフトウェア設定
#########################################################

# 補完機能の有効化
autoload -Uz compinit
compinit

# pipコマンドの補完設定
function __pip_completion {
    local words cword
    read -Ac words
    read -cn cword
    reply=( $( COMP_WORDS="$words[*]" 
            COMP_CWORD=$(( cword-1 )) \
            PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K __pip_completion pip3

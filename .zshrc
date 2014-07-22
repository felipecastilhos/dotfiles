# Lines configured by zsh-newuser-install
autoload -U compinit promptinit colors
compinit
promptinit
colors


#PROMPT="
##%{$fg[white]%} »  %{$reset_color%}"
PROMPT="
%{$fg[red]%} >  %{$reset_color%}"
RPROMPT="%B%{$fg[black]%}%~%{$reset_color%}"

[[ -t 1 ]] || return
case $TERM in
	*xterm*|*rxvt*|(dt|k|E|a)term)
		preexec () {
			print -Pn "\e]2;$1\a"    # edited; %n@%m omitted, as I know who and where I am
		}
		;;
esac

setopt CORRECT
setopt completealiases
HISTFILE=~/.histfile
export HISTSIZE=1000000
SAVEHIST=$HISTSIZE
setopt appendhistory share_history autocd extendedglob nomatch
unsetopt beep
autoload -U promptinit
promptinit
# End of lines configured by zsh-newuser-install


zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
zstyle ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'
zstyle ':completion:*' menu select

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

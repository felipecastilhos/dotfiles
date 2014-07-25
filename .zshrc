# Lines configured by zsh-newuser-install
autoload -U compinit promptinit colors
compinit
promptinit
colors


#PROMPT="
##%{$fg[white]%} »  %{$reset_color%}"
PROMPT="
%{$fg[red]%} >  %{$reset_color%}"

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

#monitor aliases
alias mm='xrandr --output HDMI-0 --off; xrandr --output DVI-I-2 --auto --output DVI-I-3 --auto --right-of DVI-I-2'      
alias mt='xrandr --output DVI-I-3 --off; xrandr --output HDMI-0 --auto --output DVI-I-2 --auto --below HDMI-0'

#git aliases
alias gst='git status'
alias glog='git log'
alias gush='git push'
alias gull='git gull'
alias gadda='git add .'
alias gmmit='git commit -m'


setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{4}[%F{6}%b%F{4}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn



vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}


	
precmd() { 
	RPROMPT="%B%{$fg[black]%}%~%{$reset_color%}  $(vcs_info_wrapper)"
}

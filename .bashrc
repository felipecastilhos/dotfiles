#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='┌───[\u@\h]──────[\w]\n└───> '


PS1='\e[1;37m┌───|\e[1;36m\]\u@\h\e[1;37m\][\e[1;36m\]\w\e[1;37m]\n└───> '

source /usr/share/doc/pkgfile/command-not-found.bash
[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

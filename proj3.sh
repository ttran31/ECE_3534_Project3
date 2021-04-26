#!/bin/bash
function Op1 {
	# print header for submenu
	printf -- '-%.0s' {1..70}; echo ""
	echo System information
	printf -- '-%.0s' {1..70}; echo ""
	
	# print information for submenu
	echo Operating System: "$(uname)"
	lsb_release -a
	
	# stay on submenu until user presses enter alone
	while :
	do
		read -n1 -s -r -p "Press [Enter] key to continue ..." key
		if [ "$key" = '' ]; then
			printf "\n"
			break
		fi
		printf "\n"
	done
}

function Op2 {
	# print header for submenu
	printf -- '-%.0s' {1..70}; echo ""
	echo Hostname and DNS information
	printf -- '-%.0s' {1..70}; echo ""

	# print submenu information
	echo Hostname : "$HOSTNAME"
	echo DNS domain : "$(dnsdomainname)"
	fqdns=$(nslookup $(hostname) | sed -n s/Name:.//p)
	fqdn="$(echo "$fqdns" | cut -d$'\n' -f1)"
	echo Fully qualified domain name : "$fqdn"
	# get IP address to print
	info=$(hostname -I)	
	ip="$(echo "$info" | cut -d' ' -f2)"
	echo 'Network address (IP) : ' " $ip"
	servers=$(grep "nameserver" /etc/resolv.conf)
	printf "DNS name servers (DNS IP) : "
       	echo "$servers" | cut -d' ' -f2 

	# stay on submenu until user presses enter alone
	while :
	do
		read -n1 -s -r -p "Press [Enter] key to continue ..." key
		if [ "$key" = '' ]; then
			printf "\n"
			break
		fi
		printf "\n"
	done
}

function Op3 {
	# print header for submenu
	printf -- '-%.0s' {1..70}; echo ""
	echo Network information
	printf -- '-%.0s' {1..70}; echo ""

	# print submenu information
	inter=$(ip -o link show | wc -l)
	echo Total network interfaces found : "$inter"
	echo '*** IP Addresses Information ***'
	ip addr show
	printf '*%.0s' {1..23}; echo ""
	echo '*** Network routing ***'
	printf '*%.0s' {1..23}; echo ""
	route
	printf '*%.0s' {1..37}; echo ""
	echo '*** Interface traffic information ***'
	printf '*%.0s' {1..37}; echo ""
	netstat -i	
	# stay on submenu until user presses enter alone
	while :
	do
		read -n1 -s -r -p "Press [Enter] key to continue ..." key
		if [ "$key" = '' ]; then
			printf "\n"
			break
		fi
		printf "\n"
	done
}
function Op4 {
	# print header for submenu
	printf -- '-%.0s' {1..70}; echo ""
	echo Who is online
	printf -- '-%.0s' {1..70}; echo ""

	# print submenu information
	printf "NAME\tLINE\t\tTIME\t\tCOMMENT\n"
	who

	# stay on submenu until user presses enter alone
	while :
	do
		read -n1 -s -r -p "Press [Enter] key to continue ..." key
		if [ "$key" = '' ]; then
			printf "\n"
			break
		fi
		printf "\n"
	done
}

function Op5 {
	# print header for submenu
	printf -- '-%.0s' {1..70}; echo ""
	echo List of last logged in users
	printf -- '-%.0s' {1..70}; echo ""

	# print submenu information
	last

	# stay on submenu until user presses enter alone
	while :
	do
		read -n1 -s -r -p "Press [Enter] key to continue ..." key
		if [ "$key" = '' ]; then
			printf "\n"
			break
		fi
		printf "\n"
	done
}
function Op6 {
	# print header for submenu
	printf -- '-%.0s' {1..70}; echo ""
	echo Public IP information
	printf -- '-%.0s' {1..70}; echo ""

	# print submenu information
	host myip.opendns.com resolver1.opendns.com | grep "myip.opendns.com has" | awk '{print $4}'
	# stay on submenu until user presses enter alone
	while :
	do
		read -n1 -s -r -p "Press [Enter] key to continue ..." key
		if [ "$key" = '' ]; then
			printf "\n"
			break
		fi
		printf "\n"
	done
}

function Op7 {
	# print header for submenu
	printf -- '-%.0s' {1..70}; echo ""
	echo Disk Usage Info
	printf -- '-%.0s' {1..70}; echo ""

	# print submenu information
	df -h | awk '{if ($1 != "Filesystem") print $5 " " $6}'

	# stay on submenu until user presses enter alone
	while :
	do
		read -n1 -s -r -p "Press [Enter] key to continue ..." key
		if [ "$key" = '' ]; then
			printf "\n"
			break
		fi
		printf "\n"
	done
}

function Op9 {
	while : 
	do
		echo "(please enter the number of your selection below)"
		echo 1. Show all proceses
		echo 2. Kill a process
		echo 3. Bring up top
		echo 4. Return to Main Menu
		echo ""

		read key

		case $key in
			1)
				ps -ef				
			;;
			2)
				printf "Please enter the PID of the process you would like to kill:\n"
				read  proc
				kill -9 $proc
			;;
			3)
				top
			;;
			4)
				break
		esac
	done
}
while :
do
	echo $(date)
	printf -- '-%.0s' {1..70}; echo ""
	echo Main Menu
	printf -- '-%.0s' {1..70}; echo ""
	echo 1. Operating system info
	echo 2. Hostname and DNS info
	echo 3 Network info
	echo 4. Who is online
	echo 5. Last logged in users
	echo 6. My IP address
	echo 7. My disk usage
	echo 8. My home file-tree
	echo 9. Process operations
	echo 10. Exit
	read -p "Enter your choice [1 - 10] " choice
	
	case $choice in 
		1)
			Op1
		;;
		2)
			Op2
		;;
		3)
			Op3
		;;
		4)
			Op4
		;;
		5)
			Op5
		;;
		6)
			Op6
		;;
		7)
			Op7
		;;
		8)
			bash proj1.sh ~ filetree.html
		;;
		9)
			Op9
		;;
		10)
			break
		;;
		*)
			continue

	esac
done

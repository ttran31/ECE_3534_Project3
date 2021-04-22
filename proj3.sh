#!/bin/bash
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
	stop="10"
	echo $choice
	if (( $choice == 10 )) ;
	then
		break
	fi
done

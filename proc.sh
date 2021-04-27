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

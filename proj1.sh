#!/bin/sh

recurse() 
{
	path=$1
	file=$2
	pos=$(basename $1)
	
	#if its a directory
	if [ -d "$path" ]
	then
		#for every object in the directory
		for i in "$path/"*
		do
			#if there is another directory recursive call 
			if [ -d "$i" ]
			then
				echo "<li>$(basename $i)" >> "$file"
				echo "<ul>" >> "$file"
				recurse "$i" "$file"
				echo "</ul>" >> "$file"
				echo "</li>" >> "$file"

			#else it should be a file and inputed into output file
			else
				echo "<li>$(basename $i)</li>" >> "$file"
			fi
		done
	elif [ -f "$path" ]
	then
		echo "<li>$pos</li>" >> "$file"
	fi
}

#Check for correct number of arguments
if [ $# != 2 ]
then
	echo "not correct number of arguments"
	exit 1
fi

# get the project directory and save
projDir=$(pwd)

cd ~
dir=$(pwd)

# open the project directory again and create filetree.html
cd $projDir
touch $2
# clear file to start from beginning
echo > $2

#creates header for html file
echo "<!DOCTYPE html>" > $2
echo "<html>" >> $2
echo "<body>" >> $2
echo "" >> $2

#set title of html as beginning directory
home=$(basename $1)
echo "<h1>$home</h1>" >> $2
echo "" >> $2
echo "<ul>" >> $2

#recursive call to get all elements inside directory
recurse "$dir" "$2"

#set end of html file
echo "</ul>" >> $2
echo "" >> $2
echo "</body>" >> $2
echo "</html>" >> $2

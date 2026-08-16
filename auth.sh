#!/bin/bash

declare -A validusers
validusers=( ["admin"]=1 ["alish"]=1 )

while true;
do
	read -p "Enter Username:" username
	echo "Username:$username"


	username_lower="${username,,}"

	if [ -z "$username" ]; then 
		echo "Can't escape  without typing username  mate , please type in username"
		continue

	fi

	if [ "$username_lower" = "hint" ]; then
		echo "Enter Username please (: (:"

	elif [[ -n "${validusers[$username_lower]}" ]]; then
		echo "You are the boss , Welcome boss $username"
		break
	else
		echo "you are not the boss, Enter username again $username"
	fi
done
echo "Login complete"

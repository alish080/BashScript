#!/bin/bash

showtime(){

	up=$(uptime -p | cut -c4-)
	since=$(uptime -s)
	cat << EOF
------
The Machine has been up for {$up}
This machine is up since {$since}
----
EOF
} 
showtime 

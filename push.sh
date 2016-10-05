#!/bin/bash

token="TOKEN"								# Token http://pushetta.com account	
channel="CHANNEL_NAME" 						# Requiere url encoder http://www.w3schools.com/tags/ref_urlencode.asp
message=$*									# Message, all parameters
expire=$(date +"%Y-%m-%d" --date='+2 day')	# Expire in 2 days


curl -H "Authorization: Token $token" -H "Content-Type: application/json" -X POST \
                 -d "{ \"body\" : \"$message\", \"message_type\" : \"text/plain\", \"expire\" : \"$expire\" }"\
                 http://api.pushetta.com/api/pushes/{$channel}/ 2> /dev/null

exit

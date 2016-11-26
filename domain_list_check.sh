#!/bin/bash
FILE=$1
while read line; do
     REQUEST=$(whois $line)
     FREE=0
     if echo $REQUEST | grep -q -s -F 'No entries found for the selected source(s)' ; then
        FREE=1
     fi
     
     if echo $REQUEST | grep -q -s -F 'No match for "' ; then
        FREE=1
     fi
     
     if [ $FREE == 1 ] ; then
         echo Domain \"$line\"  is FREE!!!
    # else
    #     echo Domain \"$line\"  is not available
     fi
done < $FILE
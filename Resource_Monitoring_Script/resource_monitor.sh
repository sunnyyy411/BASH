#! /bin/bash

FREE_SPACE=$(free -mt | grep "Total" | awk '{print $4}')
TH=500

if [[ $FREE_SPACE -lt $TH ]]
then 
     echo "WARNING! RAM is running low"
else 
     echo "Ram is sufficient - $FREE_SPACE  M is free"
fi



FILE_UTILISATION=$(df -h | grep "sda1" | awk '{print $5}' | tr -d %)

if [[ $FILE_UTILISATION -ge 80 ]]
then 
     echo "WARNING! Disk space is low"
else 
    echo "Disk space is sufficient -$((100 - FILE_UTILISATION))% is free"
fi


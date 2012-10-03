#!/bin/sh

while true;
do
        FILE=`date +"%Y-%m-%d %T" | sed 's/\ /_/g'`
        echo $FILE
        echo $FILE > $FILE
        sleep 1
done


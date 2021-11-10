#!/bin/bash

isWin=0
isHead=0
isTail=1
headCount=0
tailCount=0

while [ $isWin -eq 0 ]
do
        random=$(( RANDOM%2 ))
        if [ $random -eq $isHead ]
        then
                ((headCount++))
        else
                ((tailCount++))
        fi

        if [ $headCount -eq 21 ] && [ $tailCount -eq 21 ]
        then
                echo "Head and Tail ties."
        elif [ $headCount -eq 21 ] || [ $tailCount -eq 21 ]
        then
		if [ $(($headCount-$tailCount)) -ge 2 ] || [ $(($tailCount-$headCount)) -ge 2 ]
		then
               		if [ $headCount -gt $tailCount ]
                	then
                        	echo "Head wins by : "$(($headCount-$tailCount))
                        	isWin=1
                	else
                        	echo "Tail wins by : "$(($tailCount-$headCount))
                        	isWin=1
                	fi
		fi
        fi
done

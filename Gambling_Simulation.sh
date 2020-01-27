#!/bin/bash

echo "Welcome Gambling Simulation Problem"

#Declaring and Initializing Constants
STAKE_OF_PER_DAY=100
PER_BET=1

#Calculate 50% of stake
percent=$((STAKE_OF_PER_DAY * 50 / 100))

max_cash=$((STAKE_OF_PER_DAY + percent))
min_cash=$((STAKE_OF_PER_DAY - percent))
cash=$STAKE_OF_PER_DAY

#Check Gambler is Win or Loose
function DailyLimit()
{
	while [ $cash -gt $min_cash ] && [ $cash -lt $max_cash ]
	do
		if [[ $((RANDOM%2)) -eq 1 ]]
		then
				((cash++))
				echo "Win...$cash"
		else
				((cash--))
				echo "Loose...$cash"
		fi
	done
}

DailyLimit
 echo "Total cash of the day: $cash"

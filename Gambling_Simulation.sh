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

#Function to check daily betting
function DailyLimit()
{
	while [ $cash -gt $min_cash ] && [ $cash -lt $max_cash ]
	do
		if [[ $((RANDOM%2)) -eq 1 ]]
		then
				((cash++))
		else
				((cash--))
		fi
	done

	gainAmount=$((cash - STAKE_OF_PER_DAY))
	echo $gainAmount
}

#Calculate the total profit or loss within a month
function MonthlyGambling()
{
	for((i=1;i<=20;i++))
	do
			totalAmount=$((totalAmount + $(DailyLimit))) 
	done

	if [[ $totalAmount -gt 0 ]]
	then
			echo "Total amount of won: $totalAmount"
	else
			echo "Total amount of loose: $totalAmount"
	fi
}

MonthlyGambling

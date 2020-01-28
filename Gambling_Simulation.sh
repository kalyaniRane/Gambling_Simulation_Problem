#!/bin/bash

echo "Welcome Gambling Simulation Problem"

#Declaring and Initializing Constants
STAKE_OF_PER_DAY=100
PER_BET=1

#Declaring a dictionary
declare -A sumOfBets

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

#Calculate the daily cash nd stored it into the dictionary
function MonthlyGambling()
{
	for((i=1;i<=20;i++))
	do
			#store the every day record in a dictionary
			sumOfBets[Day$i]=$((${sumOfBets[Day$((i-1))]} + $(DailyLimit)))

	done

		#call the checkday function for sort all element of dictionary 
		echo "Luckiest Day : $( checkDay | sort -rn -k2 | head -n1)"
		echo "Unluckiest Day : $( checkDay | sort -n -k2 | head -n1)"
}

#Function to get all record of dictionary
function checkDay()
{
	for i in ${!sumOfBets[@]}
	do
			echo "$i ${sumOfBets[$i]}"
	done
}

#Function calling MonthlyGambling to calculate daily cash
MonthlyGambling

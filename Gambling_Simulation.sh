#!/bin/bash

echo "Welcome Gambling Simulation Problem"

#Declaring and Initializing Constants
STAKE_OF_PER_DAY=100
PER_BET=1

#Check Gambler is Win or Loose

	if [[ $((RANDOM%2)) -eq 1 ]]
	then
			echo "Win..."
	else
			echo "Loose..."
	fi

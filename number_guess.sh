#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET=$(( RANDOM % 1000 + 1 ))
TRIES=0

echo "Enter your username:"
read INPUT_USERNAME
USERNAME=${INPUT_USERNAME:0:22}

# Get user data
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, null)" > /dev/null
  GAMES_PLAYED=0
else
  echo "$USER_INFO" | while IFS='|' read GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

echo "Guess the secret number between 1 and 1000:"

while true
do
  read GUESS
  ((TRIES++))

  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -eq $SECRET ]]
  then
    echo "You guessed it in $TRIES tries. The secret number was $SECRET. Nice job!"
    break
  elif [[ $GUESS -gt $SECRET ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done

# Update database
((GAMES_PLAYED++))

CURRENT_BEST=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

if [[ -z $CURRENT_BEST || $TRIES -lt $CURRENT_BEST ]]
then
  $PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $TRIES WHERE username='$USERNAME'" > /dev/null
else
  $PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username='$USERNAME'" > /dev/null

#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESSES=0

echo "Enter your username:"
read USERNAME

# ambil data user
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

GAMES_PLAYED=$(echo "$USER_DATA" | awk -F'|' '{print $1}' | xargs)
BEST_GAME=$(echo "$USER_DATA" | awk -F'|' '{print $2}' | xargs)

# FIX 1: lebih strict check user baru
if [[ -z $GAMES_PLAYED || $GAMES_PLAYED == "" ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."

  # FIX 2: suppress INSERT output (INI WAJIB)
  $PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL)" > /dev/null
else
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"

while true
do
  read GUESS

  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((GUESSES++))

  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    break
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done

# ambil ulang data
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

GAMES_PLAYED=$(echo "$USER_DATA" | awk -F'|' '{print $1}' | xargs)
BEST_GAME=$(echo "$USER_DATA" | awk -F'|' '{print $2}' | xargs)

# normalize NULL
if [[ -z $BEST_GAME || $BEST_GAME == "" ]]
then
  BEST_GAME=$GUESSES
fi

((GAMES_PLAYED++))

if [[ $BEST_GAME -eq 0 || $GUESSES -lt $BEST_GAME ]]
then
  BEST_GAME=$GUESSES
fi

# FIX 3: suppress UPDATE output juga (WAJIB untuk safety)
$PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'" > /dev/null

# FINAL OUTPUT (HARUS EXACT)
echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
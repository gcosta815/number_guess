#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:"
read USER_NAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USER_NAME';")

if [ -z "$USER_ID" ]
then
  echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."
  RESULT=$($PSQL "INSERT INTO users (username) VALUES('$USER_NAME');")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USER_NAME';")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(guesses) FROM games WHERE user_id=$USER_ID;")
  BEST_GUESS=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID;")
  echo -e "\nWelcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
fi

SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=1
echo -e "\nGuess the secret number between 1 and 1000:"

GUESSING() {
  read NUMBER

  re='^[0-9]+$'
  if ! [[ $NUMBER =~ $re ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    GUESSING
  else
    if [ $NUMBER -eq $SECRET_NUMBER ]
    then
      echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      RESULT=$($PSQL "INSERT INTO games (user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES);")
    elif [ $NUMBER -gt $SECRET_NUMBER ]
    then
      echo -e "\nIt's lower than that, guess again:"
      ((NUMBER_OF_GUESSES+=1))
      GUESSING
    else
      echo -e "\nIt's higher than that, guess again:"
      ((NUMBER_OF_GUESSES+=1))
      GUESSING
    fi
  fi
}

GUESSING

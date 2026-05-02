#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

INPUT=$1

if [[ -z $INPUT ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

if [[ $INPUT =~ ^[0-9]+$ ]]; then
  ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number=$INPUT;")
else
  ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE symbol='$INPUT' OR name='$INPUT';")
fi

if [[ -z $ELEMENT ]]; then
  echo "I could not find that element in the database."
  exit 0
fi

echo "$ELEMENT" | while IFS="|" read ATOMIC NAME SYMBOL TYPE MASS MELTING BOILING; do
  echo "The element with atomic number $ATOMIC is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
done
#!/bin/bash

DIR_NAME=$(pwd)
FILES=$(ls)

echo "Current PATH is ${DIR_NAME}"

echo "This is the objects in this PATH:"

for FILE in ${FILES}
do
  if [ -f "$FILE" ]
  then
    echo "$FILE is a regular file"
  elif [ -d "$FILE" ]
  then
    echo "$FILE is a directory"
  else
    echo "$FILE is neither a file nor a directory"
  fi

  # print the files under that object
  # ls -l $FILE
done

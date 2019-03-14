#!/bin/bash

# function to count the number of files under specific directory
function file_count() {
  local DIR=$1

  if [ -d "$DIR" ]
  then
    local FILE_COUNT=$(ls ${DIR}| wc -l)
    echo "There are ${FILE_COUNT} files at directory ${DIR}"
    return 0
  else
    echo "${DIR} is not a correct directory name!"
    return 1
  fi
}

file_count $(pwd)
file_count whoami

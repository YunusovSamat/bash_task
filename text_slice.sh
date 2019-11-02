#!/bin/bash

#3. Содержание скрипта: выделение из исходной строки подстроки с границами,
# заданными порядковыми номерами символов в исходной строке.
# Усложнение: предусмотреть возможность не выделения, а удаления подстроки.
# Основные средства: команда cut, переменные оболочки.


if [[ -z $1 ]]; then
  echo "Did not enter two arguments"
  exit
else
  case $1 in
  -r) remove="true"
    shift;;
  -*) echo "unknown argument"
    exit;;
  esac
  string=$1
  if [[ -z $2 ]]; then
    echo "Did not enter second argument"
    exit
  else
    i_bgn=$2
    if [[ -z $3 ]]; then
      i_end=${#string}
    else
      if [[ $2 < $3 ]]; then
        i_end=$3
      else
        echo "begin index is greater than end index"
        exit
      fi
    fi
  fi
fi

if [[ -n $remove ]]; then
  echo "${string:0:i_bgn}${string:i_end-1}"
else
 echo "${string:i_bgn:i_end-i_bgn}"
fi
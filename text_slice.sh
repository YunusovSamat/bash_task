#!/bin/bash

#3. Содержание скрипта: выделение из исходной строки подстроки с границами,
# заданными порядковыми номерами символов в исходной строке.
# Усложнение: предусмотреть возможность не выделения, а удаления подстроки.
# Основные средства: команда cut, переменные оболочки.


if [[ -n $1 ]]; then
  case $1 in
  -r) remove="true"
    shift;;
  -*) echo "unknown argument"
    exit;;
  esac
fi

read -p "Enter the source line: " string
read -p "Enter begin index: " i_bgn
read -p "Enter end index: " i_end

if [[ -z $i_bgn ]]; then
  i_bgn=0
fi
if [[ -z $i_end ]]; then
  i_end=${#string}
fi

if [[ -n $remove ]]; then
  echo "${string:0:i_bgn}${string:i_end-1}"
else
 echo "${string:i_bgn:i_end-i_bgn}"
fi
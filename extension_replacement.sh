#!/bin/bash

# Замена существующего расширения в имени файла на заданное.
# Исходное имя файла и новое расширение передаются скрипту в качестве
# параметров. Основное средство: нестандартное раскрытие переменных.
# Усложнение: предусмотреть штатную реакцию на отсутствие расширения
# в исходном имени файла.

if [[ -z $1 ]]; then
  echo "Did not enter two arguments"
  exit
else
  if [[ -z $2 ]]; then
    echo "Did not enter second argument"
    exit
  fi
fi

if [[ -f $1 ]]; then
  dirs=${1%/*}
  file=${1##*/}
  if [[ $(expr index "$file" .) != 0 ]]; then
    mv "$1" "$dirs/${file/.*/.$2}"
  else
    mv "$1" "$1.$2"
  fi
else
  echo "file does not exist or is not file"
  exit
fi
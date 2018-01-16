#!/bin/bash
img_storage_path="/usr/share/limited_space/"

img_storage_filename=$(echo $img_storage_path | sed 's/\///g')
if [ $1 == "create" ]
then
  if [ ! -x "$img_storage_path" ]
  then
    mkdir "$img_storage_path"
  fi
  dd if=/dev/zero of=$img_storage_path$img_storage_filename bs=1M count=$3
  echo y|mkfs.ext3 $img_storage_path$img_storage_filename
  mount -o loop $img_storage_path$img_storage_filename $2
  exit 0
elif [ $1 == "drop" ]
then
  umount $2
  rm $img_storage_path$img_storage_filename
  exit 0
fi

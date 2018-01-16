#!/bin/bash

########################################################
# Variable $img_storage_path is the path which you would like to store the image file for folders.
# You can leave it as default.
img_storage_path="/usr/share/limited_space/"

###################################################################################

########################################################################################3
show_operation(){
  # Function show_operation is used for show the instraction and example use of this program.
  echo "/////////////////////////////////////////////////////////////////"
  echo "/////////////////////////////////////////////////////////////////"
  echo "If you wana to add limitation to a folder: "
  echo "./limit_folder_size.sh add [folder_path] [size, in numbers, with megabyte unit]"
  echo "----------------------------------------------------------------"
  echo "Example: ./limit_folder_size.sh add /usr/share/test 10"
  echo "////////////////////////////////////////////////////////////////"
  echo "if you wana to remove limitation for a folder which you have already add on it: "
  echo "./limit_folder_size.sh drop [folder_path]"
  echo "----------------------------------------------------------------"
  echo "Example: ./limit_folder_size.sh drop /usr/share/test"
}

find_error(){
  # Function find_error is used for detect the error if happened.
  # Place find_error after a command.
  if [ "$?" != 0 ]
  then
    echo "Error happened, we cannot handle this. Please contect to the author of this code"
    echo "So sorry"
    exit 1
  fi
}

###################################################################
# Check if runner has root premission
if [ `whoami` != "root" ]
then
  echo "You need to have root premission to execute this file"
  exit 1
fi
#####################################################################

if [ "$1" == "add" ]
then
  # The code for "add" action
  if [ $# != 3 ] # Check if there is three parameters
  then
    echo "You need to input three parameters to add limitation to that folder"
    show_operation
    exit 1
  fi
  if [ ! -x "$2" ] # Check if the folder's path (Second parameter) existed
  then
    echo "You have to create that folder first"
    exit 1
  fi
  if ! [ "$3" -gt 0 ] 2>/dev/null # Check if the third parameter is a number
  then
    echo "You have to put number in size"
    exit 1
  fi
  if [ ! -x "$img_storage_path" ] # If there is no folder for store images, the program would make a folder
  then
    mkdir "$img_storage_path"
  fi
  img_storage_filename=$(realpath $2 | sed 's/\///g') #Generate image file name
  dd if=/dev/zero of=$img_storage_path$img_storage_filename bs=1M count=$3 # Construct an empty image file with required size
  find_error
  echo y|mkfs.ext3 $img_storage_path$img_storage_filename # Format the empty image we created into ext3 format.
  find_error
  mount -o loop $img_storage_path$img_storage_filename $2 # mount the image we created to the folder's path
  find_error
  echo "Done"
  exit 0
elif [ "$1" == "drop" ]
then
  # The code for "drop" action
  umount $2 # unmont that folder
  find_error
  img_storage_filename=$(realpath $2 | sed 's/\///g') #Generate image file name
  rm $img_storage_path$img_storage_filename # remove that image
  find_error
  echo "Done"
  exit 0
else
  echo "Invilid parameters"
  show_operation
  exit 1
fi

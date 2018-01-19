#!/bin/bash
#==========================================================================
# This file is used for count how much traffic used in each different port.
# You needs to have root premission to use this program.
# Before you use this, please make sure that you have already installed the "iptables",
# because this program is based on iptables.
# enjoy!.
#==========================================================================

# Check if you have root premission
if [ `whoami` != "root" ]
then
  echo "You need to have root premission to execute this file"
  exit 1
fi

# Make sure that you have already put parameters.
if [ $# == 0 ]
then
  echo "You must input parameters"
  exit 1
fi

# Adding the port which you wana to know how much traffic used.
# The program would create a rule in iptables.
if [ $1 == "add" ]
then
  if [ $# != 2 ]
  then
    echo "You must input two parameters"
    exit 1
  fi
  if ! [ "$2" -gt 0 ] 2>/dev/null # Check if the third parameter is a number
  then
    echo "Invilid port value"
    exit 1
  fi
  iptables -A INPUT -p tcp --dport $2
  iptables -A OUTPUT -p tcp --sport $2
  exit 0
fi

# Get how much traffic used.
if [ "$1" == "get" ]
then
  if [ $# != 3 ]
  then
    echo "You must input three parameters"
    exit 1
  fi
  if ! [ "$2" -gt 0 ] 2>/dev/null # Check if the third parameter is a number
  then
    echo "Invilid port value"
    exit 1
  fi
  if [ "$3" == "in" ]
  then
    iptables -L -v -n -x | grep dpt:$2 | awk 'NR==1{print $2}'
    exit 0
  fi
  if [ "$3" == "out" ]
  then
    iptables -L -v -n -x | grep spt:$2 | awk 'NR==1{print $2}'
  fi
fi

# Clear all the record of traffic
if [ "$1" == "clean" ]
then
  iptables -Z
fi

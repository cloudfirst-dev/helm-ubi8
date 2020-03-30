#!/bin/sh
  
if helm status -n $2 $1
then
  helm namespace upgrade -n $2 $1 $1
else
  helm namespace install -n $2 $1 $1
fi

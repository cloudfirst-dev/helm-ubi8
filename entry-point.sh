#!/bin/sh
  
if helm status -n $3 $2
then
  helm namespace upgrade -n $3 $2 $1
else
  helm namespace install -n $3 $2 $1
fi

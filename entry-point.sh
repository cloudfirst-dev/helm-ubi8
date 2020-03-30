#!/bin/sh
  
if helm status -n $2 $1
then
  helm upgrade -n $2 $1 $1
else
  helm install -n $2 $1 $1
fi

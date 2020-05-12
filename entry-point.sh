#!/bin/sh
  
if helm status -n $3 $2
then
  helm upgrade -n $3 $2 $1
else
  helm install -n $3 $2 $1
fi

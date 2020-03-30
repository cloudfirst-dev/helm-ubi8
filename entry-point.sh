#!/bin/sh
  
if helm status $1
then
  helm upgrade $1 $1
else
  helm install $1 $1
fi

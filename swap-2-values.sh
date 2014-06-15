#!/bin/bash
#to swap two nos without using third variable
echo "enter first no "
read a
echo "enter second no "
read b
echo "first=$a second=$b"
a=`expr $a + $b `
b=`expr $a - $b `
a=`expr $a - $b `
echo "after swapping first=$a second=$b"




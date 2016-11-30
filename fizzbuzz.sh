#!/bin/sh

for n in $(eval echo {$1..$2}); do
  ((( n % 15 == 0 )) && echo "$n,FizzBuzz") ||
  ((( n % 5 == 0 )) && echo "$n,Buzz") ||
  ((( n % 3 == 0 )) && echo "$n,Fizz") ||
  echo $n,$n;
done

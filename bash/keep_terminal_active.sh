#!/bin/sh

# Each 60 seconds print a dot and this 3000 times
# Start...
for i in {1..3000};do sleep 60; echo -n .;done


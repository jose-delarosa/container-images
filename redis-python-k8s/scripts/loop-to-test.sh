#!/bin/bash
# Simple, no smarts

for(( i=1; i<=5000; i++)); do
    curl $1:5000
done

#!/bin/bash


<< help 

check the cup usages of the sever 
gives ingo about the cpu core


#!/bin/bash
help
echo "CPU usage of the server is....."

# Get load average from top
load=$(top -bn1 | grep "load average:" | awk '{printf "%.2f", $(NF-2)}')

echo "Current load: $load"

# Convert load to integer for comparison
load_int=${load%.*}

if [ "$load_int" -gt 1 ]; then
    echo "CPU load is very high....$load"
else
    echo "Load is normal..."
fi


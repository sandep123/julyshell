#!/bin/bash


<<help 
this is for waether reprt for every cirt



help


#!/bin/bash

CITY=$1

# Function to show usage (optional helper)
show_usage() {
    echo "Usage: $0 <city-name>"
}

# Check if city is provided
if [ -z "$CITY" ]; then
    echo "❌ Error: city name not provided."
    show_usage
    exit 1
fi

echo "📡 Fetching weather details for '$CITY'..."
echo "============================================="
echo "                🌤 WEATHER REPORT             "
echo "============================================="

# Fetch weather using wttr.in with short format
weather=$(curl -s "https://wttr.in/${CITY}?format=3")

# Validate response (check for unknown location)
if [[ "$weather" == *"Unknown location"* ]]; then
    echo "⚠️ Error: Invalid city name '$CITY'. Unable to fetch weather data."
    exit 1
fi

# Display weather
echo "$weather"
echo "============================================="


#!/bin/bash

# Script to manage Libreya Server

SERVICE="libreya"
LIBREYA_PATH="/opt/libreya"  # Change this path as per your installation
LIBREYA_CMD="python3 server.py"  # Replace with actual Libreya start command

function start_libreya() {
    if pgrep -f "$LIBREYA_CMD" > /dev/null; then
        echo "⚠️ Libreya is already running."
    else
        echo "🚀 Starting Libreya..."
        cd "$LIBREYA_PATH" || { echo "❌ Directory not found: $LIBREYA_PATH"; exit 1; }
        nohup $LIBREYA_CMD > libreya.log 2>&1 &
        echo "✅ Libreya started successfully."
    fi
}

function stop_libreya() {
    if pgrep -f "$LIBREYA_CMD" > /dev/null; then
        echo "🛑 Stopping Libreya..."
        pkill -f "$LIBREYA_CMD"
        echo "✅ Libreya stopped."
    else
        echo "⚠️ Libreya is not running."
    fi
}

function status_li_


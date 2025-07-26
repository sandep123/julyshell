#!/bin/bash


<<help

it  will check check weaher service is in active or not 

#!/bin/bash
help



service=$1

echo "====================== Check the $service Status =============="

status=$(systemctl is-active "$service")  # returns just "active", "inactive", or "failed"

echo "'$service' status: $status"

if [ "$status" = "active" ]; then
    echo "✅ '$service' service is running."
else
    echo "⚠️ '$service' service is not running."
    echo "🔄 Starting '$service' service..."
    sudo systemctl start "$service"

    # Re-check status
    new_status=$(systemctl is-active "$service")
    echo "'$service' status after attempting restart: $new_status"
fi







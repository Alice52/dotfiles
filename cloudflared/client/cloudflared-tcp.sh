#!/bin/sh

# Load configuration from config.txt
CONFIG_FILE="config.conf"

# Check if the config file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Config file not found: $CONFIG_FILE"
    exit 1
fi

# Read config file and set variables
services=()
while IFS='=' read -r key value
do
    case "$key" in
        \[service*)
            # Get the service name from the section
            SERVICE_NAME=$(echo "$key" | tr -d '[]')
            services+=("$SERVICE_NAME")
            ;;
        hostname)
            # Set the hostname variable for the current service
            eval "HOSTNAME_$SERVICE_NAME=\"$value\""
            ;;
        url)
            # Set the URL variable for the current service
            eval "URL_$SERVICE_NAME=\"$value\""
            ;;
        *)
            # Ignore unknown keys
            ;;
    esac
done < "$CONFIG_FILE"

# Start cloudflared for each service
for service in "${services[@]}"; do
    hostname_var="HOSTNAME_$service"
    url_var="URL_$service"
    cloudflared access tcp --hostname "$(eval "echo \$$hostname_var")" --url "$(eval "echo \$$url_var")" &
done

# Wait for all background processes to complete
# wait

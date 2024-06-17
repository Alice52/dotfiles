# Use an official Debian as a parent image
FROM arm64v8/debian:latest

# Install dependencies
# RUN apt-get update && apt-get install -y curl

# Install cloudflared
COPY version/cloudflared-linux-arm64-2024.6.0.deb cloudflared.deb
RUN  dpkg -i cloudflared.deb && rm cloudflared.deb

# Create a directory for the configuration
RUN mkdir /etc/cloudflared

# Copy the certification file and the startup script into the container
COPY cert/wsl@pc.pem /etc/cloudflared/cert.pem
COPY start-cloudflared.sh /usr/local/bin/start-cloudflared.sh

# Ensure the startup script is executable
RUN chmod +x /usr/local/bin/start-cloudflared.sh

# Define the entrypoint to run the startup script
ENTRYPOINT ["/usr/local/bin/start-cloudflared.sh"]

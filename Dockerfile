# Use the official Debian-based Coturn image
FROM debian:bullseye-slim

# Install necessary packages
RUN apt-get update && apt-get install -y \
    coturn \
    && rm -rf /var/lib/apt/lists/*

# Copy the Coturn configuration file
COPY turnserver.conf /etc/turnserver.conf
RUN chmod 644 /etc/turnserver.conf

# Expose the TURN server ports
EXPOSE 3478/udp 3478/tcp 5349/tcp

# Start the Coturn server
CMD ["turnserver", "-c", "/etc/turnserver.conf"]


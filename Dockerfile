# Use the official teldrive image as the base image
FROM ghcr.io/tgdrive/teldrive

# Copy your custom configuration and session files into the container
COPY ./config.toml /config.toml
COPY ./session.db /session.db

# Expose port 8080 to the host
EXPOSE 8080

# Run the container with the default entrypoint
CMD ["teldrive"]

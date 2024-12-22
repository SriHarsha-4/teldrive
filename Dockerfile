# Use the existing image as the base
FROM ghcr.io/tgdrive/teldrive

# Create a non-root user with a specific UID (e.g., 10014)
RUN useradd -u 10014 -m nonrootuser

# Switch to the non-root user
USER nonrootuser

# Set the working directory inside the container
WORKDIR /app

# Copy the config.toml and session.db from the host to the container
COPY ./config.toml /config.toml
COPY ./session.db /session.db

# Expose port 8080 to make it accessible
EXPOSE 8080

# Set the default command to run the container
CMD ["./teldrive"]

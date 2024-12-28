# Create a non-root user and switch to it
USER 10001:10001

FROM golang:alpine AS builder

# Install necessary tools
RUN apk add --no-cache git unzip curl make bash

# Set the working directory
WORKDIR /app

# Copy dependency files and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the application code and build it
COPY . .
RUN make build

# Create a minimal runtime image
FROM scratch

# Set working directory
WORKDIR /

# Copy the built binary from the builder stage
COPY --from=builder /app/bin/teldrive /teldrive

# Copy any required files
COPY --from=builder /app/session.db /session.db

# Expose the application port
EXPOSE 8080

# Set the entry point for the container
ENTRYPOINT ["/teldrive","run","--tg-session-file","/session.db"]

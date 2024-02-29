# Use the official Golang image as the base image
FROM golang:1.17 AS builder

# Set the working directory inside the container
WORKDIR /go/src/app

# Copy the Go application source code into the container
COPY . .

# Build the Go application
RUN go build -o goservice main.go

# Use a lightweight base image for the final image
FROM alpine:latest

# Copy the built executable from the builder stage into the final image
COPY --from=builder /go/src/app/goservice /usr/local/bin/

# Set the entry point for the container
ENTRYPOINT ["/usr/local/bin/goservice"]
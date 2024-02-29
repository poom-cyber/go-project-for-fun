# Use an official Go runtime as a base image
FROM golang:1.22.0-alpine AS build

# Set the current working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files to the working directory
COPY go.mod go.sum ./

# Download Go dependencies
RUN go mod download

# Copy the rest of the application code to the working directory
COPY . .

# Build the Go application
RUN go build -o myapp .

# Use a lightweight Alpine image as a base for the final image
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /root/

# Copy the compiled Go application from the build image
COPY --from=build /app/myapp .

# Expose port 8070 to the outside world
EXPOSE 8070

# Command to run the executable
CMD ["./myapp"]
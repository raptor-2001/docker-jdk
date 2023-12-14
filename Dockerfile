# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the Java application JAR file into the container
COPY HelloWorld.java .

# Compile the Java code
RUN javac HelloWorld.java

# Run the compiled Java program
CMD ["java", "HelloWorld"]

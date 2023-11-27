# Use the official PyTorch base image
FROM pytorch/pytorch:latest

# Install vim
RUN apt-get update && \
    apt-get install -y vim && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /home

# Create a folder named ".env"
RUN mkdir .env

# Your additional configurations or installations can go here

# Command to run when the container starts
CMD ["bash"]

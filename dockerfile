# Use the official PyTorch base image
FROM pytorch/pytorch:latest

# Install vim and ssh server
RUN apt-get update && \
    apt-get install -y vim openssh-server && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /workspace

# Create a folder named "env"
RUN mkdir env

# Create Python virtual environment
RUN python -m venv env

# Enable passwordless ssh login
RUN mkdir /var/run/sshd
RUN echo 'root:your_password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Add your public SSH key
RUN mkdir /root/.ssh
RUN echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDwi3RMUccCbo0xUSxqvdu+ME7q51jMMl4042hFKbfVq angelslaptop-fedora' > /root/.ssh/authorized_keys

# Expose the SSH port
EXPOSE 22

# Install Transformers
RUN . /workspace/env/bin/activate && pip install transformers

# Command to run when the container starts
CMD ["/usr/sbin/sshd", "-D"]

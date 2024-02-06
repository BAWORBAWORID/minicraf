FROM debian:10.11

# Update package lists
# Install ngrok and other dependencies
RUN apt-get update -y > /dev/null 2>&1 && apt-get upgrade -y > /dev/null 2>&1 && apt-get install ssh wget unzip vim curl python3 -y > /dev/null 2>&1

# Install SSH server
RUN apt-get install -y openssh-server

# Copy SSH server configuration file
#COPY sshd_config /etc/ssh/sshd_config
RUN mkdir /run/sshd
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "root:hacker" | chpasswd



# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]

FROM ubuntu:latest 
FROM xhofe/alist:latest



# Global environment settings
ENV PLATFORM_ARCH="amd64"
ENV MEGA_MAIL="xiyof57961@czilou.com"
ENV MEGA_PASS="SNcNx225"
EXPOSE 5244

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    python3 \
    python3-pip && \
    apt-get clean

# Download and install MEGA CMD

# Copy scripts
COPY start.sh ./
COPY keep_alive.py ./

# Install Python packages
RUN python3 -m pip install flask

# Login to MEGA account (Consider moving this to start.sh)
RUN mega-login "${MEGA_MAIL}" "${MEGA_PASS}"

# Start script
CMD ["bash", "start.sh"]

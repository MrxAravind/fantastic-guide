FROM ubuntu:22.04

# Global environment settings
ENV PLATFORM_ARCH="amd64"
ENV MEGA_MAIL="xiyof57961@czilou.com"
ENV MEGA_PASS="SNcNx225"
EXPOSE 8080

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    python3 \
    python3-pip && \
    apt-get clean

# Download and install MEGA CMD
RUN curl -o /tmp/megacmd.deb https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megacmd-xUbuntu_22.04_amd64.deb && \
    apt-get install /tmp/megacmd.deb -y && \
    rm /tmp/megacmd.deb

# Copy scripts
COPY start.sh ./
COPY keep_alive.py ./

# Install Python packages
RUN python3 -m pip install flask

# Login to MEGA account (Consider moving this to start.sh)
RUN mega-login "${MEGA_MAIL}" "${MEGA_PASS}"

# Start script
CMD ["bash", "start.sh"]

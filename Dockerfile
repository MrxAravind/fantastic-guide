FROM ubuntu:22.04

# Set environment variables
ENV DOWNLOAD_DIR=/data/
ENV HOME=/home/mega
ENV WEBDAV_PORT=8080
ENV EXTERNAL_HOST=localhost
ENV EXTERNAL_PORT=8080
ENV NEW_FILE_PERMISSIONS=600
ENV NEW_FOLDER_PERMISSIONS=700
ENV TRANSFER_LIST_LIMIT=50
ENV PATH_DISPLAY_SIZE=80
ENV INPUT_TIMEOUT=0.0166
ENV FILE_UPDATE_TIMEOUT=0.1

# Update and upgrade Ubuntu packages, install dependencies, and MegaCMD
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget && \
    wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megacmd_1.7.0-10.1_amd64.deb && \
    apt-get install -y ./megacmd_1.7.0-10.1_amd64.deb && \
    apt-get clean && \
    rm ./megacmd_1.7.0-10.1_amd64.deb && \
    mkdir -p ${HOME} ${DOWNLOAD_DIR} && \
    chmod 755 ${HOME} ${DOWNLOAD_DIR}

# Copy application files
COPY / ${HOME}

# Expose the WebDAV port
EXPOSE ${WEBDAV_PORT}

# Default command
ENTRYPOINT ["mega-webdav" "./"]

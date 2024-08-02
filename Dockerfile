FROM ubuntu:22.04

ENV DOWNLOAD_DIR /data/
ENV HOME /home/mega
ENV WEBDAV_PORT 8080
ENV EXTERNAL_HOST localhost
ENV EXTERNAL_PORT 8080
ENV NEW_FILE_PERMISSIONS 600
ENV NEW_FOLDER_PERMISSIONS 700
ENV TRANSFER_LIST_LIMIT 50
ENV PATH_DISPLAY_SIZE 80
ENV INPUT_TIMEOUT 0.0166
ENV FILE_UPDATE_TIMEOUT 0.1

ADD https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megacmd_1.7.0-10.1_amd64.deb ./

RUN apt-get update; \
    apt-get install  ./megacmd*.deb -y; \
    apt-get clean; \
    rm  ./megacmd*.deb; \
    mkdir --parents ${HOME}; \
    chmod 777 ${HOME}; \
    mkdir --parents ${DOWNLOAD_DIR}; \
    chmod 777 ${DOWNLOAD_DIR};

COPY files/ ${HOME}
EXPOSE ${WEBDAV_PORT}

RUN mega-login ${MEGA_MAIL} ${MEGA_PASS}
CMD mega-webdav ./

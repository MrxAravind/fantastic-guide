FROM ubuntu:22.04


# global environment settings
ENV PLATFORM_ARCH="amd64"
ARG RCLONE_VERSION="current"
EXPOSE 8080




ENV MEGA_MAIL xiyof57961@czilou.com
ENV MEGA_PASS SNcNx225


ADD https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megacmd_1.7.0-10.1_amd64.deb ./


 
RUN apt-get update; \
    apt-get install  ./megacmd*.deb -y; \
    apt-get clean; \
    rm  ./megacmd*.deb; \
    apt install python3 curl python3-pip -y;

RUN \
 apt-get install wget curl unzip -y && \
 wget -q https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
 unzip ./rclone-current-linux-amd64.zip && \
 mv ./rclone-*-linux-amd64/rclone /usr/bin

 
COPY start.sh ./

COPY keep_alive.py ./
COPY rclone.conf ./

RUN  python3 -m pip install flask

RUN mega-login ${MEGA_MAIL} ${MEGA_PASS}

RUN mega-webdav ./ --public

CMD rclone --config "rclone.conf" serve webdav Mega: --addr :8080 --transfers 100

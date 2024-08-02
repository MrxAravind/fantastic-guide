FROM ubuntu:22.04


# global environment settings
ENV PLATFORM_ARCH="amd64"
ARG RCLONE_VERSION="current"
EXPOSE 8080




ENV MEGA_MAIL xiyof57961@czilou.com
ENV MEGA_PASS SNcNx225


ADD https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megacmd_1.7.0-10.1_amd64.deb ./

RUN \
 apt-get install \
		wget \
		curl \
		unzip -y && \
 wget -q https://downloads.rclone.org/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-${PLATFORM_ARCH}.zip && \
 unzip ./rclone-v${RCLONE_VERSION}-linux-${PLATFORM_ARCH}.zip && \
 mv ./rclone-*-linux-${PLATFORM_ARCH}/rclone /usr/bin

 
RUN apt-get update; \
    apt-get install  ./megacmd*.deb -y; \
    apt-get clean; \
    rm  ./megacmd*.deb; \
    apt install python3 curl python3-pip -y;

COPY start.sh ./

COPY keep_alive.py ./
COPY rclone.conf ./

RUN  python3 -m pip install flask

RUN mega-login ${MEGA_MAIL} ${MEGA_PASS}

RUN mega-webdav ./ --public

CMD rclone --config "rclone.conf" serve webdav --addr :8080 --transfers 100

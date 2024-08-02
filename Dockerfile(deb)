FROM debian:buster-slim
ARG TARGETPLATFORM



ENV MEGA_MAIL xiyof57961@czilou.com
ENV MEGA_PASS SNcNx225

RUN apt-get update && \
    apt-get install curl gnupg2 -y && \
    echo path-include /usr/share/doc/megacmd/* > /etc/dpkg/dpkg.cfg.d/docker

ADD /megacmd/mc.sh /

RUN bash -c "/mc.sh $TARGETPLATFORM" && \
    apt install ./megacmd.deb -y && \
    rm -rf ./megacmd.deb && \
    rm -rf ./mc.sh && \
    apt-get remove -y curl && \
    apt-get clean


EXPOSE 4443

RUN mega-login ${MEGA_MAIL} ${MEGA_PASS}
CMD mega-webdav /

FROM ubuntu:22.04

EXPOSE 4443

ENV MEGA_MAIL xiyof57961@czilou.com
ENV MEGA_PASS SNcNx225


ADD https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megacmd_1.7.0-10.1_amd64.deb ./

RUN apt-get update; \
    apt-get install  ./megacmd*.deb -y; \
    apt-get clean; \
    rm  ./megacmd*.deb; \
    apt install python3 python-pip;


RUN mega-login ${MEGA_MAIL} ${MEGA_PASS}


CMD start.sh

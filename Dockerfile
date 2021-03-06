FROM ubuntu:16.04

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y \
	curl \
	libgtk2.0-0:i386 \
	lzma \
	xz-utils

ENV COCKPIT_VERSION=v5-0-2

RUN curl -SL https://www.devolo.de/fileadmin/Web-Content/DE/Contentseiten/Downloads/Cockpit/devolo-cockpit-${COCKPIT_VERSION}-linux.run >/tmp/cockpit.run && chmod +x /tmp/cockpit.run

RUN /tmp/cockpit.run

ADD start.sh /start.sh
CMD /start.sh



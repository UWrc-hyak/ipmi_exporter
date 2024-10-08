ARG ARCH="amd64"
ARG OS="linux"
FROM --platform=${OS}/${ARCH} alpine:3
RUN apk --no-cache add freeipmi
LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

COPY ./ipmi_exporter /bin/ipmi_exporter

EXPOSE      9290
USER        nobody
ENTRYPOINT  [ "/bin/ipmi_exporter", "--config.file", "/config/ipmiexporter-remote-config" ]

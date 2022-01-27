FROM alpine:latest
LABEL maintainer="matt@matthewrogers.org"
#comment
ENV HOME /root
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV GOPATH /root/go
ENV TZ America/New_York

ADD tunnelup.sh /root/tunnelup.sh

RUN apk update
RUN apk add tinyproxy
RUN apk add bash
RUN apk add iproute2
RUN apk add tinyproxy
RUN apk add openssh-client-default
RUN ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""
RUN chmod +x /root/tunnelup.sh

# Run this thing
CMD ["/root/tunnelup.sh"]

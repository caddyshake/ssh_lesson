FROM alpine:3.9
MAINTAINER Andrii Kirin
ARG ssh_private_key
ARG ssh_public_key

RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh

RUN echo "$ssh_private_key" > /root/.ssh/id_rsa && \
    echo "$ssh_public_key" > /root/.ssh/id_rsa.pub && \
    chmod 700 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub

RUN apk --update add git
RUN apk add openssh

VOLUME my-volume
WORKDIR my-volume

ENTRYPOINT ["git", "clone"]
CMD ["git@github.com:caddyshake/some_private_repo.git"]


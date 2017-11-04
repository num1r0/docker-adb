FROM alpine:latest
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update
RUN apk add android-tools@testing
ENTRYPOINT ["adb"]

FROM golang:1.12-alpine
RUN apk add --no-cache git
ENV GOPATH /go
RUN go get -u github.com/googlecloudplatform/gcsfuse

FROM alpine:3.9
RUN apk add --no-cache ca-certificates fuse && rm -rf /tmp/*
COPY --from=0 /go/bin/gcsfuse /usr/local/bin
WORKDIR /
CMD /bin/sh -c "while true; do sleep 30; done;"
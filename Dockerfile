FROM golang:alpine

RUN apk add --no-cache gnupg1 git

RUN go get github.com/smira/aptly \
    && cd $GOPATH/src/github.com/smira/aptly \
    && git checkout tags/v1.2.0 \
    && go get -d -v ./... \
    && go install -v ./...
COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


FROM golang:alpine as builder

WORKDIR /go/src/hello
COPY . .

RUN go get ./
RUN go build -ldflags "-s -w" -o /go/bin/hello

FROM scratch
COPY --from=builder /go/bin/hello /go/bin/hello
CMD chmod +x /go/bin/hello
ENTRYPOINT ["/go/bin/hello"]
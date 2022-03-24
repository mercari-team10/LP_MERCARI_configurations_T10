FROM golang:1.18.0-alpine3.15 AS builder
RUN apk update && apk add git
WORKDIR /nhid

COPY go.* ./
RUN go mod download

COPY . ./
RUN apk update && apk add git
RUN go build ./cmd/nhid-service

FROM alpine:3.15
WORKDIR /nhid
COPY --from=builder /nhid/nhid-service ./
ENTRYPOINT ["./nhid-service"]

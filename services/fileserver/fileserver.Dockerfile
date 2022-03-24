FROM golang:1.18.0-alpine3.15 AS builder
WORKDIR /sos
COPY . ./
RUN apk update && apk add git
RUN go build

FROM alpine:3.15
WORKDIR /sos
COPY --from=builder /sos/sos ./

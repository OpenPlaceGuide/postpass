FROM golang:1.24 AS builder

WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o /out/postpass-server ./cmd/postpass

FROM debian:trixie-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /out/postpass-server /usr/local/bin/postpass-server

EXPOSE 8081

ENTRYPOINT ["/usr/local/bin/postpass-server"]

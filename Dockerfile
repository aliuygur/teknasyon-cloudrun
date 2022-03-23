FROM golang:1.16-alpine as builder

# define build env
ENV GOOS linux
ENV CGO_ENABLED 0

WORKDIR /app

# cache and install dependencies (layer cache)
COPY go.* ./
RUN go mod download

# build app
COPY . ./
RUN go install ./cmd/...


FROM alpine:3.14 as production

RUN apk add --no-cache ca-certificates tzdata
ENV TZ Europe/Istanbul

COPY --from=builder /go/bin/* /usr/local/bin/

CMD ["server"]
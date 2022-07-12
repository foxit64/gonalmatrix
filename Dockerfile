FROM golang:1.18-alpine AS builder

WORKDIR /src
RUN apk --no-cache add gcc musl-dev
ADD cmd/gonalmatrix /src
ADD go.mod /src
RUN go get -d -v -t
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /gonalmatrix

# ---

FROM scratch

COPY --from=builder /gonalmatrix /gonalmatrix
ENTRYPOINT [ "/gonalmatrix" ]

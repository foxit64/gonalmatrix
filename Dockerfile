FROM golang:1.23-alpine AS builder

WORKDIR /src
ADD cmd/gonalmatrix /src
ADD go.mod /src
RUN go get -d -v -t
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /gonalmatrix

# ---

FROM scratch

COPY --from=builder /gonalmatrix /gonalmatrix
ENTRYPOINT [ "/gonalmatrix" ]

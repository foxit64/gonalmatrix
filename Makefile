BIN_GONALMATRIX=gonalmatrix
BIN_ANALTUX2GONALMATRIX=analtux2gonalmatrix

build:
	CGO_ENABLED=0 GOARCH=amd64 GOOS=freebsd go build -ldflags="-w -s" -o ${BIN_ANALTUX2GONALMATRIX}-freebsd ./cmd/${BIN_ANALTUX2GONALMATRIX}
	CGO_ENABLED=0 GOARCH=amd64 GOOS=freebsd go build -ldflags="-w -s" -o ${BIN_GONALMATRIX}-freebsd ./cmd/${BIN_GONALMATRIX}
	CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -ldflags="-w -s" -o ${BIN_ANALTUX2GONALMATRIX}-linux ./cmd/${BIN_ANALTUX2GONALMATRIX}
	CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -ldflags="-w -s" -o ${BIN_GONALMATRIX}-linux ./cmd/${BIN_GONALMATRIX}

clean:
	go clean
	rm ${BIN_ANALTUX2GONALMATRIX}-freebsd
	rm ${BIN_GONALMATRIX}-freebsd
	rm ${BIN_ANALTUX2GONALMATRIX}-linux
	rm ${BIN_GONALMATRIX}-linux

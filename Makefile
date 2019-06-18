# Defining variables
GOPROXY=https://goproxy.io
GO111MODULE=on
VERSION=$(shell git describe --abbrev=0 --tags &>/dev/null)
COMMIT=$(shell git rev-parse --short HEAD)

# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_NAME=app
BINARY_UNIX=$(BINARY_NAME)_unix
BINARY_WINDOWS=$(BINARY_NAME).exe

.PHONY: build
build:
	@echo "本平台编译"
	$(GOBUILD) -ldflags "-X main.GitCommit=$(COMMIT) -X main.Version=$(VERSION)" -o $(BINARY_NAME)

.PHONY: build-linux
build-linux:
	@echo "编译linux 64位平台"
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -ldflags "-X main.GitCommit=$(COMMIT) -X main.Version=$(VERSION)" -o $(BINARY_UNIX) -v

.PHONY: build-windows
build-windows:
	@echo "编译Windows 64位平台"
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 $(GOBUILD) -ldflags "-X main.GitCommit=$(COMMIT) -X main.Version=$(VERSION)" -o $(BINARY_WINDOWS) -v


.PHONY: clean
clean:
	@echo "开始清理工作"
	$(GOCLEAN)
	@rm -f $(BINARY_NAME)
	@rm -f $(BINARY_UNIX)
	@rm -f $(BINARY_WINDOWS)

.PHONY: run
run:
	$(GOBUILD) -o $(BINARY_NAME) -v ./...
	./$(BINARY_NAME)


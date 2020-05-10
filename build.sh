#!/usr/bin/env bash

(cd ui && npm install && yarn build)
packr
export LD_FLAGS="-w -s -X main.Version=$(git describe --tags | cut -c 2-) -X main.BuildDate=$(date "+%F-%T") -X main.Commit=$(git rev-parse --verify HEAD) -X main.Mode=prod";
go build -ldflags="$LD_FLAGS" -o gotify-app

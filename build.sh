#!/bin/bash

go get -u -v github.com/shadowsocks/go-shadowsocks2

cd v2ray-plugin || exit
git pull -v
go build -v

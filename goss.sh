#!/bin/bash

app=goss
ss=go-shadowsocks2
plugin=v2ray-plugin
url="ss://AEAD_CHACHA20_POLY1305:${SS_PASSWORD}@:${SS_PORT}"

start() {
  nohup $ss -s "$url" -verbose -plugin $plugin -plugin-opts "server" >>$app.log 2>&1 &
  echo $! >$app.pid
}

stop() {
  ppid="$(cat $app.pid)"
  pid="$(pgrep -P "$ppid")"
  kill -9 "$pid"
  kill -9 "$ppid"
  rm $app.pid
}

case "$1" in
start)
  start
  ;;
stop)
  stop
  ;;
restart)
  stop
  start
  ;;
*)
  echo "Usage: $0 {start|stop|restart}"
  ;;
esac

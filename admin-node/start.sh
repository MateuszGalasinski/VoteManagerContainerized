#!/bin/bash
set -e
cd /root/eth-net-intelligence-api
perl -pi -e "s/XXX/$(hostname)/g" app.json
/usr/bin/pm2 start ./app.json
sleep 3
geth --datadir=~/.ethereum/devchain init "/root/files/genesis.json"
sleep 3
BOOTSTRAP_IP=`getent hosts bootstrap | cut -d" " -f1`
GETH_OPTS=${@/XXX/$BOOTSTRAP_IP}
geth $GETH_OPTS --rpc --password /root/files/password/pass --unlock 0xc515db5834d8f110eee96c3036854dbf1d87de2b --etherbase 0xc515db5834d8f110eee96c3036854dbf1d87de2b --mine



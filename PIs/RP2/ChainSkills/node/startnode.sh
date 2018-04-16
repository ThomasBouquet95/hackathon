#!/bin/bash

geth --identity "node2" --fast --networkid 42 --datadir /home/pi/ChainSkills/node --nodiscover --rpc --rpcport "8042" --port "30303" --rpcaddr "192.168.0.103" --unlock 0 --password "password.sec" --ipcpath geth.ipc --rpccorsdomain "*" --rpcapi "web3,eth,net,parity,traces,rpc,db,personal,parity_accounts,signer,parity_set"

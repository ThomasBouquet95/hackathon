#!/bin/bash

geth --identity "node3" --fast --networkid 42 --datadir /home/pi/ChainSkills/node --nodiscover --rpc --rpcport "8042" --port "30303" --unlock 0 --password "/home/pi/ChainSkills/node/password.sec" --ipcpath geth.ipc --rpccorsdomain "*" --rpcapi "web3,eth,net,parity,traces,rpc,db,personal,parity_accounts,signer,parity_set" --rpcaddr "192.168.0.104"

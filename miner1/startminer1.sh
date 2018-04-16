#!/bin/bash

geth --identity "miner1" --networkid 42 --datadir "../miner1" --nodiscover --mine --rpc --rpcport "8042" --rpcaddr "192.168.0.101" --port "30303" --unlock 0 --password password.sec --ipcpath "geth.ipc" --rpccorsdomain "*" --rpcapi "web3,eth,net,parity,traces,rpc,db,personal,parity_accounts,signer,parity_set"

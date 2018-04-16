
## Miner1

Prior to run miner1, you will need to modify a few files.

You need to have : the IP of your computer , IP of RP1, IP of RP2, and IP of RP3

##### 1) Edit the file "static-nodes.json" and change the ip address for each enode. For instance, replace 92.168.0.101 by the ip of RP1.

The IP `92.168.0.101` was used for node1
The IP `92.168.0.102` was used for miner1
The IP `92.168.0.103` was used for node2
The IP `92.168.0.104` was used for node3

You will also need to change the same file on each RP. The file is present in the folder `ChainSkills/node`. The four files (3 on each RP and one on the miner computer) need to be the same.

##### 2) Edit the file `startminer1.sh`

You can replace `--rpcport "8042" --rpcaddr "192.168.0.101"` by the ip of the computer and the port that you want to use to communicate via rpc

if geth is not install on your computer, follow the following instruction :

go to https://geth.ethereum.org/downloads/ and identify the right version for you (ARMv7 for RPs)
run : `wget https://gethstore.blob.core.windows.net/builds/....Your...Version......`
run : `tar zxvf  ....Your...Version......tar.gz`
run : `cd ....Your...Version......`
run : `sudo cp geth /usr/local/bin`

Start the miner: `./startminer1.sh`
To start it as a background process : `nohup ./startminer1.sh &`


## Node 1, 2, and 3

You will need to put the folder `PIs/RP1` on RP1, `PIs/RP2` on RP2, `PIs/RP3` on RP3

##### 1) Edit the file `static-nodes.json` (which is in the folder ChainSkills/node) and change the ip address for each enode. You shoud have done it in the section miner1 1). This file needs to be exactly the same as the file on your computer.

Follow the instruction section miner1 1)

##### 2) Same instruction as in section miner1 2), but the starting file is `startnode.sh`

## Ethstats

Edit the file `app.json` which is in the folder `monitor`

Change   `"RPC_HOST"        : "192.168.0.101", and "RPC_PORT"        : "8042"` with the RPC IP address and RPC port of each node (TrainStation1 refers to RP1, TrainStation2 refers to RP2, TrainStation3 refers to RP3, and Miner refers to your computer).

To start ethstats : `docker-compose up -d`

Then browse to http://localhost:3001

## Explorer

On your computer, install bower : `npm install -g bower`

Run `git clone https://github.com/carsenk/explorer`

Edit the file `app.js` which is in the folder `explorer/app` and change `var GETH_HOSTNAME	= "192.168.0.102";` and `var GETH_RPCPORT  	= 8545;` by the RPC address port of your computer where the miner will be running

Run `npm install`
Run `bower install`
Run `npm start`

Then browse to : http://localhost:8000 to access the blockchain explorer


## program on each PI to read sensors data and store it to the blockchain

##### 1) On each PI modify the file `test.js` (or `sensors.js`, I don't know @TODO ) which is in the folder `ChainSkills/code`

replace `const NODE = 'http://192.168.0.101:8042'` by the RPC address and port of your computer where the miner will be running (these values are defined in the section miner1 2) )

##### 2) Start the program @TODO

## MQTT @TODO

The folder related to that is `TrainRecordData`

## Start the demo

To start the demo, follow this order :

Start miner1 on computer 1 => start node1 => start node2 => start node3 => start ethstats => start explorer
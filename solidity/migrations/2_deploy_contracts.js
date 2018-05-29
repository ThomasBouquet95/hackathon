const jsonFile = require('../node_modules/jsonfile');
var Web3 = require('web3');



NODE = 'http://192.168.0.102:8545'
HOSTNAME = 'localhost'
ETH_ACCOUNT = '0x1685bdd771b2e66828d7c28afdffd1e7ddf18810'
PASSWORD = "abc"

/*
NODE = 'http://localhost:8545'
ETH_ACCOUNT = '0x3189484fb995895096b626021bf9a6348b94cba4'
HOSTNAME = 'localhost'
PASSWORD = "Password"*/
const provider = new Web3.providers.HttpProvider(NODE);
const web3 = new Web3( provider );

web3.personal.unlockAccount(ETH_ACCOUNT,PASSWORD);



var TrainNotarization = artifacts.require("./TrainNotarization.sol");


module.exports = function(deployer) {
  deployer.deploy(TrainNotarization);
};

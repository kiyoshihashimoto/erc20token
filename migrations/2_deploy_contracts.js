// reading dapp token contract in the solidity language from our project directory

var FredToken = artifacts.require("./FredToken.sol");

module.exports = function(deployer) {
  deployer.deploy(FredToken, 1000000);
};

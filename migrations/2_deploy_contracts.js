// reading dapp token contract in the solidity language from our project directory

var VicsToken = artifacts.require("./VicsToken.sol");

module.exports = function(deployer) {
  deployer.deploy(VicsToken);
};

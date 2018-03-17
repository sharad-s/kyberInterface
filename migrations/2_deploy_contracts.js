var KyberCall = artifacts.require("./KyberCall.sol");
var KyberCallWithTrade = artifacts.require("./KyberCallWithTrade.sol");


module.exports = function(deployer) {
  // deployer.deploy(KyberCall);
  deployer.deploy(KyberCallWithTrade);
};

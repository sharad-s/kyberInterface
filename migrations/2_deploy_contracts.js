var KyberEthConverter = artifacts.require("./KyberEthConverter.sol");
var SafeMath = artifacts.require("./SafeMath.sol");




module.exports = function(deployer) {
  // deployer.deploy(KyberCall);
  deployer.deploy(SafeMath);
  deployer.link(SafeMath, KyberEthConverter);
  deployer.deploy(KyberEthConverter, arg1, arg2);
};

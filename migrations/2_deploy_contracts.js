var KyberEthConverter = artifacts.require("./KyberEthConverter.sol");



module.exports = function(deployer) {
  // deployer.deploy(KyberCall);
  deployer.deploy(KyberEthConverter);
};

const Web3 = require("web3");
const web3 = new Web3();

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    },
    ropsten: {
      host: "localhost",
      port: 8545,
      network_id: 3,
      gas: 4600000,
      gasPrice: web3.toWei("21", "gwei")
    },
  }
};

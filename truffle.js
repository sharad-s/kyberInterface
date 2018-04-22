// Allows us to use ES6 in our migrations and tests.
require("babel-register");
const secrets = require("./secrets.json");
const infura = require("./infura.json");
const HDWalletProvider = require("truffle-hdwallet-provider");

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    },
    ropsten: {
      gas: 3000000,
      gasPrice: 10000000000,
      provider: function() {
        return new HDWalletProvider(
          secrets.mnemonic,
          "https://ropsten.infura.io/" + infura.token
        );
      },
      network_id: 3 // Official ID of the Ropsten Network
    }
  }
};

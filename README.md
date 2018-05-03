# Kyber Interface Contract
Kyber Interface Contract is a Ropsten deployable contract which can be used to trade and get exchange rates from Kyber Network.


## How it Works

This contract has two methods:

1.  convertFromETH -> when ETH is sent with a call to this function, it will trade the ETH for the parameter specified token. If the transaction succeeds, the caller will receive the asset they traded their ETH for.

2.  getConversionRates -> when this function is called with the Token address for their passed in, the caller of this function will receive the conversion rate and slippage rate of ETH to Token.


### Ropsten Kyber Contract Address
 - Ropsten Kyber: 0x0a56d8a49E71da8d7F9C65F95063dB48A3C9560B

### Ropsten Token Addresses
 - ETH: 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
 - REQ: 0xa448cd1db463ae738a171c483c56157d6b83b97f
 - OMG: 0x5b9a857e0c3f2acc5b94f6693536d3adf5d6e6be

## Setup

You will need two files if you want to get this running and deployed on a network. The first is the `secrets.json` file. This file contains the 12 word mnemonic phrase used by `HDWalletProvider`, and looks something like this:

```js
{
 "mnemonic": "soda secret valid ...",
 "hdPath": "m/44'/60'/0'/0/"
}
```

The mnemonic is a BIP39 mnemonic, which you can generate [here](https://iancoleman.io/bip39/). You'll need to make sure you're using 12 words, or else `HDWalletProvider` will complain.

The next file is the `infura.json` file. This is where you can keep your [Infura](https://infura.io/) access key. That file looks something like this:

```js
{
 "token": "<YOUR INFURA TOKEN>"
}
```

Using this, you don't need to run a local node when deploying.

Once you have that all set up you can deploy to the [Ropsten](https://ropsten.etherscan.io/) testnet (that's where the Kyber contracts live) by running:

```
truffle migrate --network ropsten
```

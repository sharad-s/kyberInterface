pragma solidity ^0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";


interface IKyberNetwork {
   function trade(
        StandardToken src,
        uint srcAmount,
        StandardToken dest,
        address destAddress,
        uint maxDestAmount,
        uint minConversionRate,
        address walletId
    )
        public
        payable
        returns(uint);

    function getExpectedRate(StandardToken src, StandardToken dest, uint srcQty)
        public view
        returns (uint expectedRate, uint slippageRate);
}

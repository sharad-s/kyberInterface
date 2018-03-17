pragma solidity ^0.4.19;

import "./IERC20.sol";

interface IKyberNetwork {
   function trade(
        IERC20 src,
        uint srcAmount,
        IERC20 dest,
        address destAddress,
        uint maxDestAmount,
        uint minConversionRate,
        address walletId
    )
        public
        payable
        returns(uint);

    function getExpectedRate(IERC20 src, IERC20 dest, uint srcQty)
        public view
        returns (uint expectedRate, uint slippageRate);
}

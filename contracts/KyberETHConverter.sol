pragma solidity ^0.4.19;

import "./interfaces/IERC20.sol";
import "./interfaces/IKyberNetwork.sol";

contract KyberETHConverter  {

    //Global Variables
    IKyberNetwork public kyberRopsten;
    IERC20 public kETH;
    uint public MAX_UINT;

    //Events
    event ExecuteTrade(
      address indexed sender,
      IERC20 src,
      IERC20 dest,
      uint srcAmount,
      uint destAmount);

    function KyberETHConverter() public {
        // kyber network on ropsten
        kyberRopsten = IKyberNetwork(0x0a56d8a49E71da8d7F9C65F95063dB48A3C9560B);
        // kyber's eth token
        kETH = IERC20(0x00eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee);
        MAX_UINT = 2**256 - 1;
    }

    /* convertFromETH
      + converts eth into any token listed on kyber
      + eth must be sent with a call to this function
      @param _destToken -> the kyber address of the token we want to convert eth into
      e.g. 0xE5585362D0940519d87d29362115D4cc060C56B3 is knc
      NOTE 154837 gas was used by this function my first test
      ^ txHash: 0x929e639d86243abe0269f92bf600e12043c2432fb41c411a097b36d6400080f6

      NOTE 157401 gas was used on a second test of this updated code.
      ^ txHash: 0xc78017dd9246bb2701460f8f6fd57ecdcd612e5efb57ba83d5aedbf6b1c90752
     */
    function convertFromETH(IERC20 _destToken) public payable {
        // we will convert all of the eth sent in
        uint srcAmount = msg.value;

        // wrap the destination token in an ERC20 interface
        IERC20 destToken = IERC20(_destToken);

        // we will send resulting tokens back to the caller
        address destAddress = msg.sender;

        // disregard maxDestAmount, minConversionRate, & walletId for now
        // forward our eth value
        uint destAmount = kyberRopsten.trade.value(srcAmount)(kETH, srcAmount, destToken, destAddress, MAX_UINT, 1, 0);

        //log Trade Event
        ExecuteTrade(msg.sender, kETH, destToken, srcAmount, destAmount);
    }



    /* getConversionRates
      @notice use token address kETH for ether
      @dev retrieves expected conversion rate and slippage rate between ETH and any token listed on kyber
      @param _destToken -> the kyber address of the token we want to convert ETH into
      @return expectedRate -> expected conversion rate between ETH and token
      @return slippageRate -> expected conversion rate accounting for slippage
    */
    function getConversionRates(IERC20 _destToken) public view returns (uint expectedRate, uint slippageRate) {
        //set parameter srcQty to 1 for now
        //we will get the coversion rate between ETH and _destToken
        return kyberRopsten.getExpectedRate(kETH, _destToken, 1);

    }
}

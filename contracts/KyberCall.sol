pragma solidity ^0.4.2;

interface ERC20 {
    function totalSupply() public view returns (uint supply);
    function balanceOf(address _owner) public view returns (uint balance);
    function transfer(address _to, uint _value) public returns (bool success);
    function transferFrom(address _from, address _to, uint _value) public returns (bool success);
    function approve(address _spender, uint _value) public returns (bool success);
    function allowance(address _owner, address _spender) public view returns (uint remaining);
    function decimals() public view returns(uint digits);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}


interface KyberNetworkContract {
    //Kyber Contract 0x0a56d8a49E71da8d7F9C65F95063dB48A3C9560B
     function getExpectedRate(ERC20 src, ERC20 dest, uint srcQty)
        public view
        returns (uint expectedRate, uint slippageRate);

}

contract KyberCall  {

    KyberNetworkContract public kyberNetworkRopsten;
    address _kyberNetwork = 0x0a56d8a49E71da8d7F9C65F95063dB48A3C9560B;

    function KyberCall() public {
        kyberNetworkRopsten = KyberNetworkContract(_kyberNetwork);
    }

    function callGetExpectedRate(ERC20 _source, ERC20 _dest, uint _srcQty) public view returns (uint expectedRate, uint slippageRate) {
        return kyberNetworkRopsten.getExpectedRate(_source, _dest, _srcQty);
    }


}

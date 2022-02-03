//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract CryptosToken{
    string public constant name = "Cryptos";
    uint supply;
    address public immutable owner;


    constructor(uint _supply){
    owner = msg.sender;
    supply = _supply;  

    }

    function setSupply(uint value) public {
        supply = value;
    } 
    function getSupply() public view returns(uint){
        return supply;
    }
}
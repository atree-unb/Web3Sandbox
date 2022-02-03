// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Property{
    uint public price;
    address public owner;

    constructor(){
        price = 0;
        owner = msg.sender;
    }
    //modifies the functions to have this requirement
    modifier onlyOwner(){
        require(owner==msg.sender);
        _;
    }

    function changeOwner(address _owner) public onlyOwner {
        //require(owner == msg.sender);
        owner = _owner;
    }

    function setPrice(uint _price) public onlyOwner { 
        //require(owner == msg.sender);
        price = _price;
    }


}
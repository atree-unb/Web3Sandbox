//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Property{

    //1. Boolean Types
    bool public sold;

    //2. Integer Types
    uint8 public x = 255;
    int8 public y = -10;

    function f1() public{
        x +=1; //Integer Overflow
    }

}
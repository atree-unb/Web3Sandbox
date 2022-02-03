//SPDX-License-Identifier: GPL-3.0

pragma solidity  ^0.8.7;

contract FixedSizeArrays{
    uint[3] public numbers = [23,42,6];

    bytes1 public b1;
    bytes2 public b2;
    bytes3 public b3;
    //... up to bytes32

    function setElement(uint index, uint value) public{
        numbers[index] = value; 
    }

    function getLength() public view returns(uint){
        return numbers.length;
    }

    function setBytesArray() public{
        b1 = 'a'; // => 0x61 
        b2 = 'ab'; // => 0x6162 
        b3 = 'z'; // => 0x7A0000
    }

}
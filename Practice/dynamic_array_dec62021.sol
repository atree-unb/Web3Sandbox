//SPDX-License-Identifier: GPL-3.0

pragma solidity  ^0.8.7;

contract DynamicArrays{

    uint[] public numbers; 

    function getLenth() public view returns(uint){
        return numbers.length;
    }

    function addElement(uint item) public{
        numbers.push(item);
    }
    
    function getElement(uint i) public view returns(uint){
        if (i < numbers.length){
            return numbers[i];
        }
        return 0;
    }

    
    // removing the last element of the array
    function popElement() public{
        numbers.pop();
    }

    function f() public pure{
        // declaring a memory dynamic array
        // it's not possible to resize memory arrays (push() and pop() are not available).
        uint[] memory y = new uint[](3);
        y[0] = 12;
        y[1] = 24;
        y[2] = 31;
       // numbers = y;
    }

} 
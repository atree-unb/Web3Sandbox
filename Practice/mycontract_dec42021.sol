// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;


contract Property {
    int public value;

    ///@notice Sets the value to be equal to the value inputted. 
    function setValue(int _value) public {
        value = _value;
    }
}


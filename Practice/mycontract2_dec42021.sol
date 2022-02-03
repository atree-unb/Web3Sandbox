// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7 < 0.9.0;

contract Property {
    int public price = 100;
    string public location = "London";
    address immutable public owner; //Immutable cannot be changed, but can initialized immediately or in constructor
    int constant area = 100; //Constant cannot be changed, must be initialized immediately

    constructor(int newprice, string memory newlocation){
        price = newprice;
        location = newlocation;
        owner = msg.sender;
    }

    function testFunct() public pure returns(int){
        int x = 5;
        x = x*2;
        string memory s1 = "gdfg";
        return x;
    }

    //Calling a setter function (transaction) does change the blockchain, and it DOES cost gas | Setter = Expensive 
    function setPrice(int newprice) public {
        price = newprice;
    }
    
    //Calling a getter function (call) does not change the blockchain, and it DOES NOT cost gas | Getter = Free
    function getPrice() public view returns (int){
        return price;
    }        

    function getLocation() public view returns(string memory){
        return location;
    }

    function setLocation(string memory newlocation) public{
        location = newlocation;
    }

}

/**************************************
 Note:
1) Storage: 
-Holds state vairables
-Persistent adn expensive(costs gas)
-Like a computer HDD 

2) Stack:
-Holds local vairables defined inside functions if they are not reference types (int is not a ref. type)
-Free to be used (does not cost gas)

3) Memory: 
-Holds local variables defined inside functions if thery are not reference types but declared with the "memory" keyword
-Holds function arguments
-Like a computer ram

->REFERENCE TYPES: string, array, struct and mapping
**************************************/
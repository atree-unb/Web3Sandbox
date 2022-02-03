//SPDX-License-Identifier: GPL-3.0

pragma solidity  ^0.8.7;

contract Deposit{

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    // declaring the receive() function that is executed when sending ETH to the contract address
    // it was introduced in Solidity 0.6 and a contract can have only one receive function, 
    // declared with this syntax (without the function keyword and without arguments). 
    receive() external payable{
    }

    // declaring a fallback payable function that is called when msg.data is not empty or
    // when no other function matches
    fallback() external payable{
    }

    // ether can be sent and received by the contract in the trasaction that calls this function as well
    function sendEther() public payable{
        uint x; 
        x++;
    }

    // returning the balance of the contract. 
    function getBalance() public view returns(uint){
        // this is the current contract, explicitly convertible to address, 
        // and balance is a member of any variable of type address.
        return address(this).balance;
    }    

    function transferEther(address payable recipient, uint amount) public returns(bool){
        require(owner == msg.sender, "Transfer failed, you are not the owner:(");

        if (amount <= getBalance()){
            recipient.transfer(amount);
            return true;
        } else {
            return false;
        } 
    }


}





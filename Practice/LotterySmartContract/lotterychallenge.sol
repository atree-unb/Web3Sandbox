//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract lottery{
    address payable[] public players;
    address public manager;

    constructor(){
        manager = msg.sender; 
        players.push(payable(manager)); //Automatically add manager to the lottery
    }

    receive()external payable{
        require(msg.sender != manager, "Manager cannot enter lottery"); //Manager cannot participate
        require(msg.value == 0.1 ether, "Entry amount must be 0.1 Ether"); //100000000000000000 wei
        players.push(payable(msg.sender));
        }

    function getBalance() public view returns(uint){
        //require(msg.sender == manager, "Admin rights required");
        return address(this).balance;
    }

    function random() internal view returns(uint){
        //require(msg.sender == manager, "Admin rights required");
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players.length)));

        //for actually random use chainlink vrf
    }

    function pickWinner() public {
        
        //require(msg.sender == manager, "Admin rights required");
        //require(players.length >= 3);
        require(players.length >= 3); //If  there are atleast 10 players anyone can pick winner

        uint r = random();
        address payable winner;

        uint index = r % players.length;
        winner = players[index];
        
        uint managerFee = getBalance()*1/10; //Manager fee =  10%
        uint winnerPrize = getBalance()*9/10; //Winner Prize = 90%

        winner.transfer(winnerPrize);//Pay winner
        payable(manager).transfer(managerFee); //Pay Manager

        players = new address payable[](0); //reset lottery

        players.push(payable(manager)); //Automatically add manager to the lottery for the next round
    }

    fallback() external payable{
        require(msg.sender != manager, "Manager cannot enter lottery"); //Manager cannot participate
        require(msg.value == 0.1 ether, "Entry amount must be 0.1 Ether"); //100000000000000000 wei
        players.push(payable(msg.sender));
    }




}
//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract lottery{
    address payable[] public players;
    address public immutable manager;

    constructor(){
        manager = msg.sender; 
    }

    receive()external payable{
        require(msg.value == 0.1 ether, "Entry amount must be 0.1 Ether"); //100000000000000000 wei
        players.push(payable(msg.sender));
        }

    function getBalance() public view returns(uint){
        require(msg.sender == manager, "Admin rights required");
        return address(this).balance;
    }

    function random() internal view returns(uint){
        require(msg.sender == manager, "Admin rights required");
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players.length)));

        //for actually random use chainlink vrf
    }

    function pickWinner() public {
        require(msg.sender == manager, "Admin rights required");
        require(players.length >= 3);
        uint r = random();
        address payable winner;

        uint index = r % players.length;
        winner = players[index];
        
        winner.transfer(getBalance());
        players = new address payable[](0); //reset lottery
    }

    fallback() external payable{
        require(msg.value == 0.1 ether);
        players.push(payable(msg.sender));
    }




}
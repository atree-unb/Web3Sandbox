//SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.7;

contract A{
    string public s1 = "George";
    string public s2 = "McRib";
    string public new_str;

    function concatenate1() public view returns(string memory){
        string memory s3;
        s3 = string(abi.encodePacked(s1,s2));
        return s3;
    }

    function concatenate2() public {
        new_str = string(abi.encodePacked(s1,s2));
    }

    function concatenate3(string memory str1,string memory str2) public pure returns(string memory){
        string memory str3 = "0";
        str3 = string(abi.encodePacked(str1,str2));
        return str3;
    }
}

contract B is A{
    string public test_str = "Hamborger<";
    string public test_str2 = "3HamBorGhini";

    string public testresult = concatenate3(test_str,test_str2);

}
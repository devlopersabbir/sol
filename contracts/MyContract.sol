// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MyContract {
    string myName = "Sabbir Hossain";
    uint age = 22;
    address myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    struct MyStruct {
        string name;
        uint age;
        address walletAddress;
    }

    MyStruct public assignStructValue = MyStruct(myName, age, myAddress);

    function getValue () public pure returns (uint) {
        uint value = 1;
        return value;
    }
}
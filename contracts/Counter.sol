// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Counter {
    uint public count = 0;

    function increment() public {
        count++;
    }
    function decrement() public {
        count--;
    }
}
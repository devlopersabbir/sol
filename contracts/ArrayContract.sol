// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ArrayContract {
    // uint[] public arr = [1, 2, 3];
    string[] private nameArr = ["Sabbir", "Rafiul", "Minarul"];


    function addName(string memory _value) public {
        nameArr.push(_value);
    }
    function getNames() public view returns (string[] memory) {
        return nameArr;
    }
    function getLength() public view returns (uint256) {
        return nameArr.length;
    }
    function getSingleNameWithQuery (uint256 index) public view returns (string memory) {
        // filter name
        return nameArr[index];
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ConditionLoop {
    address owner;

    constructor(){
        owner = msg.sender;
    }

    uint256[] nums = [10, 20, 30];

    function isEvenNumber(uint _number) private pure returns (bool) {
        if(_number % 2 == 0) {
            return true;
        }else {
            return false;
        }
    }

    function countEvenNumber() private view returns (uint) {
        uint count = 0;

        for(uint i = 0; i < nums.length; i++){
            if(isEvenNumber(nums[i])){
                count++;
            }
        }
        return count;
    }

    function findOddNumbers() private view returns (uint[] memory) {
        uint[] memory result = new uint[](nums.length);
        
        for (uint i = 0; i < nums.length; i++){
            if(!isEvenNumber(nums[i])){
                result[i] = nums[i];
            }
        }
        return result;
    }

    function isOner(address _add) public view returns (bool){
        return (_add == owner);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Ownable {
    address owner;

    constructor(){
        owner = msg.sender;
    }
    // create a modifire for only owner can get secret token
    modifier onlyOwner() {
        require(msg.sender == owner, "You must be owner");
        _;
    }
}
contract SecretProvider {
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

     function getSecret() public view returns (string memory) {
        return secret;
    }
}

contract InheritDeep is Ownable {
    address secret;

    constructor(string memory _secret) {
        SecretProvider _secretProvider = new SecretProvider(_secret);
        secret = address(_secretProvider);
        super;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        return SecretProvider(secret).getSecret();
    }
}

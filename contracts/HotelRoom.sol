// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract HotelRoom {
    enum RoomStatus {
        FULL,
        EMPTY
    }
    address payable public owner;
    RoomStatus currentStatus;
    event BookingEvent(address _book, uint _ammountOfValue);

    constructor(){
        owner = payable(msg.sender);
        currentStatus = RoomStatus.EMPTY;
    }

    modifier onlyWhileEmpty {
        require(currentStatus == RoomStatus.EMPTY, "Currently empty you can book now");
        _;
    }

    modifier costs(uint _ammount) {
        require(msg.value >= _ammount, "Not enough ether provided");
        require(msg.value <= 90, "Ammount should be less than 90");
        _;
    }

    function getCurrentStatus () public view returns (string memory) {
        if(currentStatus == RoomStatus.FULL){
            return "Full";
        }else {
            return "Empty";
        }
    }

    function requestForChangeStatus () public {
        if(currentStatus == RoomStatus.FULL){
            currentStatus = RoomStatus.EMPTY;
        }else {
            currentStatus = RoomStatus.EMPTY;
        }
    }

    function book() public payable onlyWhileEmpty costs(2 ether) {
        currentStatus = RoomStatus.FULL;
        owner.transfer(msg.value);

        // require(true);

        emit BookingEvent(msg.sender, msg.value);
    }
} 
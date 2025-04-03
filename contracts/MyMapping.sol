// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


struct Book {
    string title;
    string author;
    uint256 publishAt;
}

contract MyMapping {
    mapping(uint256 => Book) books;
    // nested mapping
    mapping(address => mapping(uint256 => Book) books) public ourBooks;

    function createBook(uint256 _id, string memory _title, string memory _author, uint256 _publishAt) public {
        books[_id] = Book(_title, _author, _publishAt);
    }
    function createOurBook(uint256 _id, string memory _title, string memory _author, uint256 _publishAt) public {
        ourBooks[msg.sender][_id] = Book(_title, _author, _publishAt);
    }
    function getBooks() public {
    }

}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    //mappings
    mapping(uint => string) public names;
    mapping(uint => Book) public books;
    mapping(address => mapping(uint => Book)) public myBooks;

    struct Book {
        string Title;
        string author;
    }


    constructor()  {

        names[1] = "Juan";
        names[2] = "Paco";
        names[3] = "Pepe";

    }

    function addBook(
        uint _id, 
        string memory _title, 
        string memory _author
    ) public {

        books[_id] = Book(_title,_author);

    }
    function addMyBook(
        uint _id, 
        string memory _title, 
        string memory _author
    ) public {

        //msg.sender la persona que esta llamando al contrato
        myBooks[msg.sender][_id] = Book(_title,_author);

    }


}
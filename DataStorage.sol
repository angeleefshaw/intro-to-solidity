pragma solidity ^0.6.0;

contract DataStorage {

    struct People {
        uint256 favoriteNumber;
        string name;
    } 

    //fixed array with maximum of one person
    People[1] public person;

    //dynamic array that can hold a list of people
    People[] public people;

    //There are two ways to store information - memory and storage. Data stored in memory is session based while data stored in storage is persistent. 
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        //create a people object and push it into people array
        people.push(People({favoriteNumber: _favoriteNumber, name: _name}));
    }

}
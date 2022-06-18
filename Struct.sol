// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Struct {
    // Struct is used to group variables together
    // You can't modify memory Structs. You need to add the storage keyword if you want to modify
    struct Car {
        string name;
        uint year;
        address owner;
    }
    Car public toyota;
    // Creating a struct car array to store all struct of cars 

    Car [] public cars;

    constructor(){
    // Creating a storage instance of the above struct
         toyota.name = "Toyota";
         toyota.year = 1999;
         toyota.owner = msg.sender;
         cars.push(toyota);
    }
    function getStruct() external view returns (Car [] memory){
        // Returns a struct instace
        // 0:tuple(string,uint256,address)[]: Toyota,1999,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        return cars;
    }
    function setNewCarStruct(string memory _name, uint _year) external {
        Car memory newCar = Car(_name, _year, msg.sender);
        cars.push(newCar);
    }
    function getCarType(uint _index) external view returns(Car memory) {
        return cars[_index];
    }
    function deleteCarByIndex(uint _index) external {
        delete cars[_index];
    }
    function updateCar(uint _index, string memory _name) external returns(string memory){
        // storage keyword allows you to modify a struct because the value is available in the contract
        // unlike memory where it gets cleared after usage.
        Car storage updatedCar = cars[_index]; // get car by index from cars array
        if(_index > cars.length){
            revert("Array index out of bounds");
        }
        updatedCar.name = _name;
        return "Updated";
    }
}
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Mapping{
    // A mapping is just like a python dictionary or a javascript object...
    mapping(string => uint) public names;
    // City - Person - Age
    mapping(string => mapping(string => uint)) public population;
    // Struct

    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car [] public cars;

    Car public rolls = Car("Rolls Royce", 1990, msg.sender);
    
    constructor(){
        names["James"] = 90;
        names["Adam"] = 80;
        population["Lagos"]["James"] = 90;
    }
    function getName(string memory _name) external view returns(uint){
        return names[_name];
    }
    function getPopulation(string memory _city, string memory _name) external view returns(uint){
        return population[_city][_name];
    }
}
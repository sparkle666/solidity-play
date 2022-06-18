// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Ownable {
    // A contract that sets owner on deployment and switch owner. Use modifiers
    address public owner;
    string name;
    constructor (){
        owner = msg.sender;
    }
    function switchOwner(address _newOwner) external onlyOwner(_newOwner) {
        owner = _newOwner;
    }
    function anyoneCanCall() external returns(string memory) {
        name = "Sparkles";
        return name;
    }
    function onlyOwners() external view returns(string memory){
        require(owner == msg.sender);
        return "Hello only owners";
    }
    modifier onlyOwner(address _newOwner){
        require(owner == msg.sender, "Only owner can call this function");
        require(_newOwner != address(0), "new owner cannot be 0 address..."); // ensure that address is not the 0 address - 0x0000...
        _;
    }
}
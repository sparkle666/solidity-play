// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract TestContract1 {
    address public owner = msg.sender;

    function setOwner(address _owner) external {
        require(owner == _owner, "Only owner change address");
        owner = _owner;
    } 
}

contract TestContract2 {
    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;
    
    constructor(uint _x, uint _y) payable {
        x = _x;
        y = _y;
    }
}

contract Deployer{
    event Deployed(address);
    fallback () external payable {}
    // this function deploys any contract by passing in the bytecode.
    function deploy(bytes memory _code) external payable returns(address addr) {
        // TestContract1 test = new TestContract1();
        // return test;
        // callvalue() : the amount of ether to pass to the smart contract when deploying
        // add(_code, 0x20): this tells solidity compiler to skip the first 32 bytes. First 32 bytes
        // is the length of the code. 0x20 is 32 in decimals.

        assembly{
            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }
        require(addr !=  address(0), "Deployed failed"); //checks that the address is not the default 0 address which is denotes empty
        emit Deployed(addr);
    }

    function execute (address _target, bytes memory _data) external payable{
        (bool success, ) = _target.call{value: msg.value}(_data);
        require(success, "Failed...");
    }
}

// helper contract to retrieve bytecode

contract Helper {
    function getByteCode1() external pure returns (bytes memory){
        bytes memory bytecode = type(TestContract1).creationCode;
        return bytecode;
    }
     function getByteCode2(uint x, uint y) external pure returns (bytes memory){
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode, abi.encode(x, y));
    }
    function getCallData(address _owner) external pure returns(bytes memory){
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }
}

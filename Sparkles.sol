// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//address  public address2=0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db; //sample reciever
contract sendether{
    address payable public owner;
    bytes public data;
    constructor()payable {
     owner=payable(msg.sender);   
    }
   
    uint public contractbalance;//contract value 
    uint public ownerbalance;
    uint public balanceto;
    
    function sendviacall(address payable _to,uint _value)public payable{//returns(bool sent,byte memory data) {
        (bool sent,)=_to.call{value: _value}("");
        ownerbalance=owner.balance;
        balanceto=_to.balance;
        contractbalance=address(this).balance;
        require(sent,"failed to send");
    }
}
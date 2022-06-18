//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
//Any version from 0.8.4 upwards
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Sparkles is ERC20{
    
    uint public totalTokenValue;
    event Received(address sender, uint amount);
    event Sent(address recipient, uint amount, address sender);

    constructor()ERC20("Sparkles","SPK"){
        _mint(msg.sender, 1000000 *(10 ** 18));
        totalTokenValue = (totalSupply()/(10 ** 18));

    }

    function buyToken (address recipient) public payable returns(uint){
        uint amount;
        amount= msg.value;
        emit Received(msg.sender, amount);

        uint tokenAmount = (amount /(10**18) ) * 1000;
      
        _mint(recipient, tokenAmount *(10 ** 18));
        emit Sent(recipient, tokenAmount *(10 ** 18), msg.sender);

        totalTokenValue = (totalSupply()/(10 ** 18));

        return totalTokenValue;
       
    } 


}
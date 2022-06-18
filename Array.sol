// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Array{
    uint[] public scores  = [2, 4, 5];

    function pushArr() external returns(uint){
        scores.push(2);
        return scores[scores.length - 1];
    }
    function popArr() external {
        scores.pop();
    }
    function lenArr() external view returns(uint){
        return scores.length;
    }
    function delArr() external{
        delete scores[0];
    }
    function updateArr() external returns(uint){
        scores[3] = 90;
        return scores[3];
    }
}
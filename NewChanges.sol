// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract NewChange{
    string public greet = "Hello world!!";
    bool public isRequired = true;
    uint public amount = 23;
    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    int public min = type(int).min;
    uint public count;
    // Constant lesson
    uint public constant BASE_NUM = 90;
    uint public BASE_NUM2 = 90;
    // add two numbers function

    function add(uint x, uint y) external pure returns(uint){
        return x + y;
    }
    function globalVars() external view returns(address, uint, uint){
        address owner = msg.sender;
        uint timeStamp = block.timestamp;
        uint blockNum = block.number;
        return (owner, timeStamp, blockNum);
    }
    function pureFunc() external pure returns (uint) {
        uint x = 30;
        uint y = 8;
        return x + y;
    }
    function viewFunc() external view returns(uint){
        return block.number;
    }
    // Lesson 9: Counter contract

    function increment() public {
        count += 1;
    }
    function decrement() public {
        count -= 1;
    }

    // Lesson 12: If else statements

    function ifElse() external pure returns(uint) {
        if(10 > 1){
            return 10;
        } else if(10 < 1) {
            return 1;
        } else{
            return 0;
        }
    }

    function tenary() external pure returns(uint) {
        return 10 > 1 ? 10: 1;
    }

    // For and while loops      

    function loops(uint _number) external pure  returns(uint){
        uint sum;
        for (uint x = 0; x > _number; x++){
             sum += x;
        }
        uint y = 0;
        while(y < _number){
            sum += y;
        }
        return sum;
    }

    // Lesson 14: Error handling

    function err(uint _num) external equalsTen checkArgs(_num) {
        count += _num;
    }
    function revertFunc(uint _num) external pure {
        if (_num == 10){
            revert("num must be anything but to 10");
        }
    }
    
    // Lesson 15: Function Modifiers

    modifier equalsTen () {
        require (count > 0, "Count must be greater than 0");
        _;
    }
    modifier checkArgs(uint _nums){
        require(_nums > 10, "number must be greater than 10");
        _;
    }
}
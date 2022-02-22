pragma solidity ^0.4.24;

contract Sample {
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    uint256 openingTime = 1645550882;
    address owner;
    uint public personCount = 0;
    uint256 public currentTimestamp = block.timestamp;
    
    mapping(uint => Person) public people;
    
    modifier onlyAfterTime (){
        require(block.timestamp >= openingTime);
        _;
    }
    constructor () public {
        owner = msg.sender;
    }
    function addPeople  (string memory _first, string memory _last) public onlyAfterTime {
        incrementCount();
        people[personCount] = Person(personCount, _first, _last);
    }
    function incrementCount() internal {
        personCount += 1;
    }
}

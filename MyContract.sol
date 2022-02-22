pragma solidity ^0.4.24;

contract SecContract {
    enum State {Waiting, Ready, Active }
    State public state;
    
    constructor ()public {
        state = State.Waiting;
    }
    function isActive() public view returns (bool){
        return state == State.Active;
    }
    function activate() public {
        state = State.Active;
    }
}

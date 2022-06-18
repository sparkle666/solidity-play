// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Enum {
    enum State {
        None,
        Pending,
        Shipped,
        Received,
        Rejected
    }
    // initialise an enum, think of the status identifier as datatype. So it comes before the instance name
    State public state;

    function setState(State _state) external {
        // the state will passed in as an integer from 0
        if(_state == State.None){
            state = _state;
        } else if (_state == State.Pending){
            state = _state;
        }
         else if (_state == State.Shipped){
            state = _state;
        }
         else if (_state == State.Received){
            state = _state;
        }
         else if (_state == State.Rejected){
            state = _state;
        }
        else{
            revert("Status passed in out of scope");
        }
    }
    function getState()external view returns(State){
        return state;
    }
    modifier validateState (State _state){
        // require(_state == State.Pending || State.None || State.Shipped || State.Received || State.Rejected,
        //  "Pls pass in a pending state of integer 1");
        _;
    }
}


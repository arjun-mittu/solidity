pragma solidity ^0.4.24;

contract Simple {
    uint256 public price;
    string public location;
    address public owner;
    mapping(address => uint256) bid;
    enum State {
        Running,
        Stopped
    }
    State public status;

    constructor() public {
        status = State.Running;
        owner = msg.sender;
    }

    function set_value(uint256 _price, string _location) public {
        price = _price;
        location = _location;
    }

    function sendEther() public payable {
        bid[msg.sender] = msg.value;
    }
}

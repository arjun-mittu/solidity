pragma solidity ^0.4.2;

contract A {
    uint256 public x = 5;
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function get_x() public view Onlyowner returns (uint256) {
        //require(msg.sender==owner);
        return x;
    }

    modifier Onlyowner() {
        require(msg.sender == owner);
        _;
    }
}

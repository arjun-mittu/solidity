pragma solidity ^0.4.24;

contract Simple {
    mapping(address => uint256) public bid;

    function place_bid() public payable {
        bid[msg.sender] = msg.value;
    }
}

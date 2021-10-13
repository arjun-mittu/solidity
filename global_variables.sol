pragma solidity ^0.4.24;
contract GlobalVariables{
    uint public this_moment=now;
    uint public block_number=block.number;
    uint public difficulty=block.difficulty;
    uint public gaslimit=block.gaslimit;
    uint public timestamp=block.timestamp;
}
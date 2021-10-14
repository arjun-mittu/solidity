// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
contract Coin{
    address public minter;
    mapping (address=>uint) public balances;
    event Sent(address from,address to,uint amount);
    constructor(){
        minter=msg.sender;
    }
    function mint(address reveiver,uint amount) public{
        require(msg.sender==minter);
        balances[reveiver]+=amount;
    }
    error InsufficientBalance(uint requested,uint availble);
    function send(address reveiver,uint amount) public{
        if(amount>balances[msg.sender]) revert InsufficientBalance(
            {
                requested:amount,
                availble:balances[msg.sender]
            }
            );
        balances[msg.sender]-=amount;
        balances[reveiver]+=amount;
        emit Sent(msg.sender,reveiver,amount);
    }
}
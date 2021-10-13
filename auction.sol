pragma solidity ^0.4.24;

contract Auction{
    address public owner;
    uint public startBlock;
    uint public endBlock;
    enum State{Started,Running,Ended,Canceled}
    State public auctionState;
    uint public highestBindingBid;
    address public highestBidder;
    uint public bidIncrement;
    mapping(address=>uint) public bids;
    constructor() public {
        owner=msg.sender;
        auctionState=State.Running;
        startBlock=block.number;
        bidIncrement=10;
        endBlock=startBlock+40320;//this auction runs for 7 days
    }
    modifier OnlyOwner(){
        require(msg.sender==owner);
        _;
    }
    modifier afterStart(){
        require(block.number>=startBlock);
        _;
    }
    modifier beforeEnd(){
        require(block.number<=endBlock);
        _;
    }
    modifier NoOwner(){
        require(msg.sender!=owner);
        _;
    }
    function cancel_autcion() OnlyOwner public{
        auctionState=State.Canceled;
    }
    function min(uint a,uint b) pure internal returns(uint){
        if(a>=b) return b;
        else return a;
    }
    function Place_bid() public payable NoOwner afterStart beforeEnd returns(bool){
        require(auctionState==State.Running);
        require(msg.value>=0.01 ether);
        uint currentBid=bids[msg.sender]+msg.value;
        require(currentBid>highestBindingBid);
        bids[msg.sender]=currentBid;
        if(currentBid<=bids[highestBidder]){
            highestBindingBid=min(currentBid+bidIncrement,bids[highestBidder]);
        }
        else{
            highestBindingBid=min(currentBid,bids[highestBidder]+bidIncrement);
            highestBidder=msg.sender;
        }
        return true;
    }
    function finalAuction() public{
        require(auctionState==State.Canceled || block.number>endBlock);
        require(msg.sender==owner || bids[msg.sender]>0);
        address recipient;
        uint value;
        if(auctionState==State.Canceled){
            recipient=msg.sender;
            value=bids[msg.sender];
        }
        else if(msg.sender==owner){
            recipient=owner;
            value=highestBindingBid;
        }
        else if(msg.sender==highestBidder){
            recipient=highestBidder;
            value=bids[highestBidder]-highestBindingBid;
        }
        else{
            recipient=msg.sender;
            value=bids[msg.sender];
        }
        recipient.transfer(value);
    }
}
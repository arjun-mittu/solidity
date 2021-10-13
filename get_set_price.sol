pragma solidity ^0.4.24;
contract Property{
    uint price;
    string public location='London';
    function setPrice(uint _price) public{
        price =_price;
    }
    function getPrice() public view returns(uint){
        return price;
    }
    
}
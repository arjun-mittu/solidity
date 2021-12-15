pragma solidity ^0.5.11;

contract eval{
    uint[] public arr;
    function pushtoArray(uint val) public{
        arr.push(val);
    }
    function getarray() public view returns(uint[] memory array){
        return (arr);
    }
    function getLength() public view returns (uint){
        return arr.length;
    }
    function getElement(uint idx) public view returns(uint){
        return arr[idx]; 
    }
    function updateELmenet(uint idx , uint newValue) public{
        arr[idx]=newValue;
    }
    //this function will change the value to default value, the length of the array will remain same
    function deleteElement(uint idx) public{
        delete arr[idx];
    }
    //In this the length will reduce and element will be deleted
    function remove(uint idx) public{
        arr[idx]=arr[arr.length-1];
        arr.pop();
    }
}
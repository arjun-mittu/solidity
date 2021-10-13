pragma solidity ^0.4.24;
contract Simple{
    struct Car{
        string brand;
        uint built_in_year;
        uint value;
        string fuel_type;
    }
    address public owner;
    Car public private_car;
    enum State{Running,Stopped,Inactive}
    State public status=State.Running;
    function Car_status() public{
        status=State.Stopped;
    }
    constructor (string _brand,uint _built_in_year,uint _value,string _fuel_type) public{
        private_car.brand=_brand;
        private_car.built_in_year=_built_in_year;
        private_car.value=_value;
        private_car.fuel_type=_fuel_type;
        owner=msg.sender;
    }
    function set_car(uint _built_in_year,uint _value) public{
        private_car.value=_value;
        private_car.built_in_year=_built_in_year;
    }
    function modify_car(string _brand,uint _built_in_year,uint _value,string _fuel_type) public returns(bool){
        require(msg.sender==owner);
        if(status==State.Running){
            Car memory newCar=Car({
                brand:_brand,
                built_in_year:_built_in_year,
                value:_value,
                fuel_type:_fuel_type
            });
            private_car=newCar;
            return true;
            }
        else return false;
    }
}
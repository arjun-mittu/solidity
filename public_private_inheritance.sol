pragma solidity ^0.4.24;
contract A{
    uint a=8;
    uint public x=10;
    uint public b=5;
    function get_a() public view returns(uint){
        return a;
    }
    function f1() public view returns(uint){
        return x;
    }
    function f2() private view returns(uint){
        return b;
    }
    function f3() public view returns(uint){
        uint a1;
        a1=f2();
        return a1;
    }
    function f4() internal view returns(uint){
        return x;
    }
    function f5() external view returns(uint){
        return b;
    }
}
contract B{
    A public a11=new A();
    uint public xxx1=a11.f1();
    //uint public xxx2=a11.f2();//error
    //uint public xxx3=a11.f4();//error
    uint public xxx4=a11.f5();
    
}
contract C is A{
    uint public xx=f4();
    A public a=new A();
    uint public x3=a.f5();
    
}
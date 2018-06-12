pragma solidity ^0.4.24;

contract Mohit{
    mapping(address=>uint) record;
    address owner;
    constructor(){
        owner = msg.sender;
    }
    function () public payable{
        owner.send(msg.value);
        record[msg.sender]= msg.value;
    }
    
    function getdetail(address adr) public view returns(uint)
    {
        return record[adr];
    }
}

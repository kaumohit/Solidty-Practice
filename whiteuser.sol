pragma solidity 0.4.24;

contract Mohit{
    address[] white;
    uint k;
    address owner;
    uint time;
    uint count;
    uint bal;
    constructor() public payable{
        k=0;
        owner = msg.sender;
        time = now;
    }
    modifier checkowner()
    {
        require(owner==msg.sender,"only owner can add whitelisted");
        _;
    }
    function addwhite(address add) checktime checkowner public returns(string) {
        white.push(add);
        k++;
        return "successfull";
    }
    
    function checkwhite(address add) public returns(uint){
         count=0;
        for(uint i=0;i<k;i++)
         if(add == white[i])
         {
          count++;
          break;
         } 
         return count;
    }
    
    function () checktime public payable 
    {
        uint c = checkwhite(msg.sender);
        if(c==1)
         {
            address(this).send(msg.value);
         }
    }
    
    
    modifier checktime(){
        require(now<time + 36000,"ICO sale is over");
        _;
    }
    
    function checkbal() public returns(uint){
        bal = address(this).balance;
        return bal;
    }
    
    function transToOwner() checkowner payable{
        owner.send(address(this).balance);
    }
}



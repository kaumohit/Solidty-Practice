pragma solidity ^0.4.24;

contract Mohit
{
    mapping(address=>uint) bidder;
    address owner;
    address hbidadd;
    uint hbidamount=0;
    uint start;
    int count=0;
   constructor() public{
        owner = msg.sender;
        start = now;
    }
    
     modifier mod1(){
         require(now<start+120 ,"Bidding time finished");
        _;
    }
    function bid(address add,uint amount) mod1 public{
        bidder[add]=amount;
        if(hbidamount < amount)
        {
            hbidadd = add;
            hbidamount = amount;
        }
    }
    
    function withdrawbid(address add) mod1 public 
    {
        delete bidder[add];
    }
    
    modifier mod(){
         require(owner== msg.sender,"not initiated by owner ");
         require(now>start+120,"Bidding time not finished");
        _;
    }

    modifier mod2(){
         require(count==0," Money has been transfered");
        _;
    }
    function trans() mod mod2 public payable{
      bool val = hbidadd.send(hbidamount);   
      if(val == false)
      revert();
    }
    
    function Winner() mod public view returns(address,uint)
    {
        return(hbidadd,hbidamount);
    }
    
    function getbid(address add) returns(uint){
        return bidder[add];
    }
}// contract end 

pragma solidity ^0.4.24;
import "./Mohit1.sol";
contract Mohit2 is Mohit1 {
   
   uint public sum;
   
   function getResult (uint x,uint y) public view returns (uint){
       sum = f1(x,y);
        //sum;
   }
   
}

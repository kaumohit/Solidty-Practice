pragma solidity ^0.4.24;


contract Mohit
{
    uint16 x=0;
    uint16 y=1;
    uint16[] a;
    uint16 k=0;
    function print() public returns (uint16[])
    {
    while(x<50)
    {
     a[k++]=x;
     uint16 z=x+y;
     x=y;
     y=z;
    } 
     return a;
    }
}

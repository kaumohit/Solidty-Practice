pragma solidity ^0.4.24;
contract Crud {struct User {
   string email;
   address userAddress;
   string name;
}
   mapping(string => User) a;   

 function create (string mail, address addr, string nam) public {
       a[mail].email = mail;
       a[mail].userAddress = addr;
       a[mail].name = nam;
   }
   
   
   function read (string mail) public view returns (string first, address second, string third) {
       first = a[mail].email;
       second = a[mail].userAddress;
       third = a[mail].name;
   }
   
   
   function update (string mail, address addr, string name) public  {
       create (mail, addr, name);
   }
   
   function del (string mail) public {
       delete a[mail];
   }
}


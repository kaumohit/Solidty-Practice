    pragma solidity ^0.4.24;

    contract Mohit {
        struct project{
            string name;
            uint value;
        }
        
        mapping(address=>project) pdetail;
        address highestprojectadd;
        uint highestfund = 0;
        uint campdead= 240;
        uint projectdead = 120;
        uint minentryfeeP = 10 ether;
        uint minentryfeeC = 1 ether;
        uint time;
        address owner;
        uint projectentrymoney;
    
        constructor() public {
            time = now;
            owner = msg.sender;
        }
    
        struct person{
            address[] addr;
            uint[] value;
        }
    
        mapping(address=>person) usermapping;
        mapping(address=>uint) totalfund;
        address[] padd;
    
        modifier checkowner() {
            require(owner==msg.sender,"only owner can add whitelisted");
            _;
        }
    
        modifier checkproject() {
            require(now < time + projectdead,"Project Entry time is over");
            _;
        }
    
        function setPbid(string name) checkproject public payable returns(string){
            if(msg.value >= minentryfeeP) {
                if(pdetail[msg.sender].value == 0) {
                    address(this).send(msg.value);
                    projectentrymoney+= msg.value;
                    pdetail[msg.sender].name = name;
                    pdetail[msg.sender].value = msg.value;
                    return "Project enterd";
                    padd.push(msg.sender);
                }
                else {
                     return "Project bid cannot be modified";
                }
           }
           else {
            return "give min entry free ";
           }
        } 
    
        modifier checkperson(){
            require(now< time + campdead,"Project Entry time is over");
            _;
        }
    
       function fundproject(address addproject) public payable returns(string){
           if(msg.value >= minentryfeeC){
               address(this).send(msg.value);
               usermapping[addproject].addr.push(msg.sender);
               usermapping[addproject].value.push(msg.value);
               totalfund[addproject]+= msg.value;
           
               if(totalfund[addproject]> highestfund){
                   highestfund = totalfund[addproject];
                   highestprojectadd = addproject;
               }
               return "funding successfull";
           }
           else{
               return "give min entry fee";
           }
       
       }
   
       function getWinProjectName() checkowner public returns(string,uint) {
            if(now > time + campdead) {
                if(address(this).balance >= projectentrymoney + highestfund)
                    highestprojectadd.send(projectentrymoney+highestfund);
                    return (pdetail[highestprojectadd].name,highestprojectadd.balance);
            }
            else
                return ("Campianing time is not finished",0);
         
        }
   
        function sendbidback() checkowner public returns(string) {
            if(now > time + campdead ) {
               for(uint i=0;i<padd.length;i++) {
                   for(uint j=0;j<usermapping[padd[i]].addr.length;j++)
                       usermapping[padd[i]].addr[j].send(usermapping[padd[i]].value[j]);
               } 
           }
           return "done";
        }
}// contract end

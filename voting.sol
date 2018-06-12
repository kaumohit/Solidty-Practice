pragma solidity ^0.4.24;

contract Mohit{
    uint time;
    uint limit = 2 minutes;
    constructor(){
     time = now;
    }
    struct voter{
        string name;
        uint vote;
    }
    mapping(address=>voter) map;
    uint[3] cand;
    
    function castvote(address a,string name,uint vote) public
    {
        map[a].name = name;
        map[a].vote= vote;
        cand[vote-1]++;
    }
    
    function getVotes(uint candidateid) public view returns(uint)
    {
        if(candidateid >= 1 && candidateid <=3)
         return cand[candidateid-1];
        else
         return 0;
    }
    function getWinner() public view returns(string)
    {
        if(now > time + limit)
        {
          if(cand[0]>cand[1] && cand[0]>cand[2])
           return "Ram";
          else if(cand[1]>cand[0] && cand[1]>cand[2] )
           return "Shyam";
           else
            return "Ravan";
        }
        else
        {
            return "voting time still there";
        }
    }
}

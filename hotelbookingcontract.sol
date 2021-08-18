pragma solidity ^0.6.0;

contract hotelroom {
    //learning follwing 
    //ether- pay smart contracts
    //modifiers
    //visibility
    //events
    //enums(status - vacant / occupied)
    
    enum status { vacant , occupied }
    status currentstatus;
    
    event occupy(address _occupant, uint _value);
    
    address payable public owner;
    
    constructor() public {
        owner = msg.sender;
        currentstatus = status.vacant;
    }
    
    modifier onlywhilevacant {
        require(currentstatus == status.vacant, "currently occupied");
        _;
        
    }
    
    modifier cost(uint _amount)  {
         require(msg.value >= _amount , "not enough ether");
        _;
        
    }
    
    receive() external payable onlywhilevacant cost(2 ether) {
        
       
        owner.transfer(msg.value);
        currentstatus = status.occupied;
        emit occupy(msg.sender,msg.value);
    }
    }
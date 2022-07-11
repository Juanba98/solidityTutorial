// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable{
    address owner;

   

    constructor ()  {
       
        owner = msg.sender;

    }
    
     modifier onlyOwner(){
        require(msg.sender == owner, "Tienes que ser el dueno!");
        _;    
    }
}

contract SecretVault {
    string secret;

    constructor (string memory _secret)  {
        secret = _secret;
          
    }

    function getSecret() public view returns (string memory)  {
        return secret;

    }
}

contract MyContract is Ownable{

   
    address secretVault;
  
    
    constructor (string memory _secret)  {
        //Creamos un contrato dentro de un contrato
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        //Para llamar al constructor del padre Ownable
        super;
       
    }
    

    function getSecret() public view onlyOwner returns (string memory)  {
  
        return SecretVault(secretVault).getSecret();

    }
}
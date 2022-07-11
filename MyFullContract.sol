// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract HotelRoom { 

    enum Statuses {
        Vacia, 
        Ocupada
    }

    Statuses public currentStatus;



    //payable permite que la direccion reciba monedas
    address payable public owner;
    
    //Evento que saltara cuando se acitve la funcion book
    event Occupy (address _occupant, uint _value);


    constructor() payable {
        owner = payable (msg.sender);
        currentStatus = Statuses.Vacia;
    }


    modifier onlyWhileVacant{
         //Break si no es cierto
        require(currentStatus == Statuses.Vacia, "Actualmente Ocupada");
        _;//Indica cuando se ejecuta la funcion

    }

    modifier costs (uint _amount){

      require(msg.value>= _amount, "No has enviada la cantidad minima");
         _;
    }

    function book() public payable onlyWhileVacant costs(2 ether) {
        
        currentStatus = Statuses.Ocupada;
        //Mada monedas al recipientes, es decir owner
        //msg.value es la cantidad
        /*  
            Puede causar problemas
            owner.transfer(msg.value);
        */
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent);


        emit Occupy(msg.sender, msg.value);


    }

}
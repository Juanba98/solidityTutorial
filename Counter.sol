// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract Counter {

    uint public count = 0;


    //Lo ponemos publico para que cuando se cree el contrato pueda ser llamado
    
    /* Podemos prescindir de este constuctor ya que podemos inicializar las variables al declararlas 

        constructor() public {

            count=0;
        }
    */
   //View nos indica que no va a mificar el estado del contrato
    //Con returns indicamos el tipo de valor a retornar 
    /*
    Podemos borrar esta fucion puesto que si asignamos a la variable count
    la visibilidad public solity nos proporciona el get
        
        function getCount() public view returns (uint) {

            return count;
        }
    */

    //Cuando cambiamos el estado del contrato tenemos que pagar gas
    function incrementCount() public {

        count++;
    }



} 
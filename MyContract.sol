// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    //Variables de estado
    //--------------------------------------------
    uint public myUnit  = 1;
    //The EVM (Ethereum Virtual Machine) uses 256 bits as its word size
    //Se utiliza tamaños de 23bytes pra que el precio del gas no pueda ser ilimitado
    //uint = uint256
    uint256 public myUnit256  = 1;
    uint8 public unit8   = 1;

    int public myInt  = 1;

    string public myString  = "Hello, world!";
    bytes32 public myBytes23 = "Hello, world!";


    address public myAddress = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;


    //Tipos customizables

    struct MyStruct{
        uint256 myUint256;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Hello, world!");

    //--------------------------------------------



    //Pure noss asegura que no va a leer o modificar el estado
    function getValue() public pure returns (uint256) {
        uint256 value = 1;
        return value;
    }
}
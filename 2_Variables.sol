pragma solidity ^0.8.0; //Utilizar en version ^0.6.0 en Remix

contract MyContract {
    // - State Variables  - Almacenadas en blockchain 
    //int`s
        int public myInt = 1; //cualquier tipo de int
        uint public myUint = 1; //solo valores positivos
        uint256 public myUint256 = 1; //int`s muy grandes "10000000000"
        uint8 public myUint8 = 1; //int´s pequeños - para procesos mas eficientes
    //string`s
        string public myString = "Hello, world!"; //string`s normales
        bytes32 public myBytes32 = "Hello, World!"; //String`s  mas pequeños = eficientes
    //wallet address
        address public myAddress = 0x0859E6A42144d635664bcb9DB099441c1FAF19ee;
    
    //Array
        //para mostrar un valor con la funcion public , se le deberá pasar la posición 
        uint[] public uintArray = [1,2,3];
        string[] public stringArray = ["apple", "banana", "carrot"];
        string[] public values;
        uint[][] public array2D = [ [1,2,3],[4,5,6] ];
        function addValue(string memory _value) public{ // memory, declarar variables temporales
            values.push(_value);
        }
        function valuesCount() public view returns(uint){
            return values.length;
        }
    //estructura de datos
        struct Person {
            uint id;
            string name;
        }
        struct MyStruct {
            uint myUint;
            string myString;
        }

        Person public Persona = Person (12345678, "Carlos"); //constructor 
        MyStruct public myStructura = MyStruct (1, "example string"); //constructor 

    
    // - Local Variables
        function getValue() public pure returns(uint){
            uint value = 1;
            return value;
        }
}
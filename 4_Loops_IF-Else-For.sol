pragma solidity ^0.8.0; //Utilizar en version ^0.6.0 en Remix

contract MyContract {
    uint[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    //if-else
    function esDivisible(uint _number) public pure returns(bool) {
        if(_number % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }
    //comprobar si el que ejecuta la funcion es el que ejecuto el contrato
    function isOwner() public view returns(bool) {
        return(msg.sender == owner);
    }
    //contar los numeros que son divisibles
    function contarDivisibles() public view returns (uint) {
        uint count = 0;

        for(uint i = 0; i < numbers.length; i++) {
            if(esDivisible(numbers[i])) {
                count ++;
            }
        }

        return count;
    }


}
pragma solidity ^0.8.0; //Utilizar en version ^0.6.0 en Remix

contract Counter{
    uint public count = 0;

    function incrementCount() public {
        count ++;
    }
}
pragma solidity ^0.8.0; //Utilizar en version ^0.6.0 en Remix

//contrato para gestion de hotel
contract HotelRooms {
    
    //State variable 
    enum Statuses {Vacant, Occupied}
    Statuses currentStatus;

    //evento que 
    event Occupy(address _occupant, uint _value);

    //wallet address de ejecutor del contrato
    address payable public owner;

    constructor() public {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }


    //verifica si la habitacion esta vacia
    modifier OnlyWhileVacant{
        require(currentStatus == Statuses.Vacant, "Currently occupied.");
        _;
    }
    //verifica si el pago es correcto
    modifier costs(uint _amount){
        //check Price
        require(msg.value >= _amount, "Not enough Ether provided.");
        _;
    }
    

    //funcion para reservar habitacion
    receive() external payable OnlyWhileVacant costs(2 ether){
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
        emit Occupy(msg.sender,msg.value);
    }
}

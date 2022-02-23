pragma solidity ^0.8.0; //Utilizar en version ^0.6.0 en Remix

//Contrato para verificar el usuario/dueño
contract Ownable {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "must be owner");
        _;
    }
}
//Contrato para almacenar la palabra secreta
contract SecretVault {
    string secret;
    
    constructor(string memory _secret) public {
        secret = _secret;
    }

    function getSecret() public view returns(string memory) {
        return secret;
    }
}
//Contrato Main
contract MyContract is Ownable { //Hereda a "Ownable" para poder llamar a su funcion
    address secretVault;

    constructor(string memory _secret) public {
        SecretVault _secretVault = new SecretVault(_secret); //llamar a otro SmartContract
        secretVault = address(_secretVault);
        super;
    }

    function getSecret() public view onlyOwner returns(string memory) {
        SecretVault _secretVault = SecretVault(secretVault);
        return _secretVault.getSecret();
    }
}
pragma solidity ^0.8.0; //Utilizar en version ^0.6.0 en Remix

contract MyContract {
    //Mappings
    //Base de datos - Clave => Valor
    mapping(uint => string) public names;
    mapping(uint => Book) public books;
    mapping(address => mapping(uint => Book)) public myBooks;
    
    struct Book {
        string title;
        string author;
    }
    //constructor que se inicia al realizar el deploy del contrato
    constructor () public{ //si pides un valor que no corresponde, no da error, devuelve el valor por defecto
        names[1]="Alvaro";
        names[2]="Carlos";
        names[3]="Sauco";
    }

    function addBook(uint _id, string memory _title, string memory _author) public {
        books[_id] = Book(_title, _author);
    }
    function addMyBook(uint _id, string memory _title, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
}
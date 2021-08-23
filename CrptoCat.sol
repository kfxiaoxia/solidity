// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CryptoCat {
     
     struct Cat {
        uint id;
        string name;
        string color;
    }
    mapping(address => Cat) cats;
    uint catIndex = 0;
    
    event  BuyCryptoCat(
        address sender,
        Cat cat
        );
        
    event  ChangeCryptoCat(
        address sender,
        Cat cat
        );
        
    event  QueryCryptoCat(
        address sender,
        Cat cat
        );
    
    function buyCryptoCat() public {
        Cat memory cat =  Cat(catIndex,"default_name", "#000000");
        cats[msg.sender] =  cat;
        emit BuyCryptoCat(msg.sender, cat);
    }
    
    function change(string memory _name, string memory _color) public {
        Cat memory cat = cats[msg.sender];
        cat.name = _name;
        cat.color = _color;
        cats[msg.sender] = cat;
        emit ChangeCryptoCat(msg.sender, cat);
    }
    
    function query() public view returns(Cat memory) {
        Cat memory cat = cats[msg.sender];
        return cat;
    }
    
}

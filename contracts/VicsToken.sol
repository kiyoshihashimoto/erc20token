pragma solidity ^0.4.2;


// this contract mints the tokens and also must know where they are
contract VicsToken {
	// Constructor
	// Set the total number of tokens
	// Read the total number of tokens

	// Name - getter
	string public name = "Vics Token";

	// Symbol
	string public symbol = "VICS";	
	string public standard = "Vics Token v1.0";	

	// public visibility gives a getter function 
	uint256 public totalSupply;

	// test for events by looking at the transaction receipt
	event Transfer(
		address indexed _from,
		address indexed _to,
		uint256 _value
	);

	// mapping in solidity is like a hash table
	// key value store like an associated array
	mapping(address => uint256) public balanceOf;

	// add an arguement to this constructor function
	constructor (uint256 _initialSupply) public {
		// 1 M total supply
		// state varaible is available to total contract and will write to storage
		// underscore for local variables - convention
		// state variables like totalSupply
		balanceOf[msg.sender] = _initialSupply;
		totalSupply = _initialSupply;

		// allocate the initial supply
		// write a value with brackets and pass it a key and set the value
		// msg is a global variable in solidity that has several diff values you can read from it
		// in solidity there is meta data
	}

	// Transfer
	// address is a special data type in solidiity
	function transfer(address _to, uint256 _value) public returns (bool success) {
		
		// Exception if account doesn't have enough
		// must have enough tokens to send to people
		// read balance
		// require in solidity - if this evaluates to true continue function execution, otherwise throw an error
		// if you are using gas, all the gas to this point will still get used but the rest will get refunded
		require(balanceOf[msg.sender] >= _value);
		balanceOf[msg.sender] -= _value;
		balanceOf[_to] += _value;

		// Transfer Event
		Transfer(msg.sender, _to, _value);

		// Return Boolean
		return true;
		
	}

}
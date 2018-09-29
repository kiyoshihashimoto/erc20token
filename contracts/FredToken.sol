pragma solidity ^0.4.2;


// this contract mints the tokens and also must know where they are
contract FredToken {
	// Constructor
	// Set the total number of tokens
	// Read the total number of tokens

	// Name - getter
	string public name = "Fred Token";

	// Symbol
	string public symbol = "FRED";	
	string public standard = "Fred Token v1.0";	

	// public visibility gives a getter function 
	uint256 public totalSupply;

	// test for events by looking at the transaction receipt
	event Transfer(
		address indexed _from,
		address indexed _to,
		uint256 _value
	);

	// events are just a way to emit that something happened from a contract
	// consumers can subsribe to these events and are logged in transaction logs
	// approve
	event Approval(
		address indexed _owner,
		address indexed _spender,
		uint256 _value
	);

	// mapping in solidity is like a hash table
	// key value store like an associated array
	mapping(address => uint256) public balanceOf;
	// state variable with public vis so free get function
	// associative arrays, key value pairs
	mapping(address => mapping(address => uint256)) public allowance;

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
		// "require" in solidity - if this evaluates to true continue function execution, otherwise throw an error
		// if you are using gas, all the gas to this point will still get used but the rest will get refunded
		require(balanceOf[msg.sender] >= _value);
		balanceOf[msg.sender] -= _value;
		balanceOf[_to] += _value;

		// Transfer Event
		Transfer(msg.sender, _to, _value);

		// Return Boolean Standard
		return true;

	}

	// Delegated Transfer 
	// transfer from, approve function, and allowance function
	// approve - allow another account to spend tokens on their behalf
	// allowance - alloted amount that we have approved to transfer

	// approve
	// the account to approve (address on exchange) and the amount that we will approve
	function approve(address _spender, uint256 _value) public returns (bool success) {
		
		// allowance
		allowance[msg.sender][_spender] = _value;

		// approve
		Approval(msg.sender, _spender, _value);

		return true;
	}

	// transfer from
	function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {

		require(_value <= balanceOf[_from]);
		require(_value <= allowance[_from][msg.sender]);
		balanceOf[_from] -= _value;
		balanceOf[_to] += _value;
		allowance[_from][msg.sender] -= _value;
		Transfer(_from, _to, _value);
		return true;

		// require from has enough tokens
		// require allowance is big enough
		// change the balance
		// update the allowance
		// transfer event
		// return a boolean
	}

	// allowance

}
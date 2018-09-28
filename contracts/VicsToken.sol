pragma solidity ^0.4.2;

contract VicsToken {
	// Constructor
	// Set the total number of tokens
	// Read the total number of tokens

	// public visibility gives a getter function 
	uint256 public totalSupply;

	function VicsToken () public {
		// 1 M total supply
		// state varaible is available to total contract and will write to storage
		totalSupply = 1000000;
	}
}
pragma solidity ^0.4.25;

import "./testA.sol";
import "./testC.sol";
import "../../../../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";

contract TestB is ERC721Token {
	string public name = "";
	string public symbol = "";

	TestA testA;
	TestC testC;

	constructor(TestA _testA, TestC _testC) public ERC721Token(name, symbol) {
		testA = _testA;
		testC = _testC;
	}

	function sell(uint256 _tokenId) public{
		testC.setItem(testA, this, _tokenId);
		approve(testC, _tokenId);
	}

	function transfer(address _buyer, uint256 _tokenId, uint256 _value) public{
		address owner = ownerOf(_tokenId);

		// revert here
		testA.transferFrom(_buyer, owner, _value);

		transferFrom(owner, _buyer, _tokenId);
		
	}

	function mint(address _to, uint256 _tokenId) public{
		_mint(_to, _tokenId);
	}
}

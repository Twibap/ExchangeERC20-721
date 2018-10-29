pragma solidity ^0.4.25;

import "./testA.sol";
import "./testB.sol";

contract TestC {

	TestA testA;
	TestB testB;
	address seller;
	address buyer;
	uint256 value;
	uint256 itemId;

	constructor() public {
	}

	function setItem(TestA _testA, TestB _testB, uint256 _itemId) public{
		seller = msg.sender;
		testA = _testA;
		testB = _testB;
		itemId = _itemId;
	}

	function bid(uint256 _value) public{
		buyer = msg.sender;
		value = _value;
	}

	function exchange() public{
		// every single line make revert
//		testB.transfer(buyer, itemId, value);
		testA.transferFrom(buyer, seller, value);
//		testB.transferFrom(seller, buyer, itemId);
	}

}

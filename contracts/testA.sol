pragma solidity ^0.4.25;

import "./testB.sol";
import "./testC.sol";
import "../../../../node_modules/openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

contract TestA is MintableToken{
	string public name = "";
	string public symbol = "";
	uint8	 public decimal = 18;

	TestB testB;

	function setTest(TestB _testB) public {
		testB = _testB;
	}

	function bid(TestC _testC, uint256 _value) public{
		approve(testB, _value);		// token721 contract
		approve(_testC, _value);	// market contract
		_testC.bid(_value);
	}

}

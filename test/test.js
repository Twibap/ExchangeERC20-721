const ContractA = artifacts.require("TestA");
const ContractB = artifacts.require("TestB");
const ContractC = artifacts.require("TestC");

contract("Test", async()=>{
	var testA;
	var testB;
	var testC;

	it("deploy", async()=>{
		testA = await ContractA.deployed();
		testB = await ContractB.deployed();
		testC = await ContractC.deployed();

		testA.setTest(testB.address);
	});

	var manager = web3.eth.accounts[0];
	var seller	= web3.eth.accounts[1];
	var buyer		= web3.eth.accounts[2];
	var tokenId = 1234;
	var tokenAmount = 20000;
	it("mint", async()=>{
		await	testA.mint(buyer, web3.toWei(tokenAmount), {from:manager});
		await	testB.mint(seller, tokenId, {from:manager});
	})

	it("sell", async()=>{
		await testB.sell(tokenId, {from:seller});
	})
//	it("Token to Token exchange", async()=>{
//		await testA.approve(testB.address, web3.toWei(tokenAmount), {from:buyer});
//		await testB.transfer(buyer, tokenId, web3.toWei(tokenAmount), {from:seller});
//	})
	it("Market exchange", async()=>{
		await testA.bid(testC.address, web3.toWei(tokenAmount), {from:buyer})
		await testC.exchange();
	})
});

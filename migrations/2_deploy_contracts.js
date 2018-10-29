const ContractA = artifacts.require("TestA");
const ContractB = artifacts.require("TestB");
const ContractC = artifacts.require("TestC");

module.exports = function(deployer){
	deployer.deploy(ContractA).then(function(){
		return deployer.deploy(ContractC);
	}).then(function(){
		return deployer.deploy(ContractB, ContractA.address, ContractC.address);
	});
};

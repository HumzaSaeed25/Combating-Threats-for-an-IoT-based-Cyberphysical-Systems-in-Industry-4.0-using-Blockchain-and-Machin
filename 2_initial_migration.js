const Migrations = artifacts.require("AdditionContract");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};

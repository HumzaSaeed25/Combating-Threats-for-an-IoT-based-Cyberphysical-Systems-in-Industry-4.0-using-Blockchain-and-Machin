pragma solidity ^0.4.18;

contract testbed {
  address[] public authority;
  authority.push(0xcec646349d71e34c0c128eea6b88ddfa0e60431b);
  uint public actuation = 0;
  
  function inspectSender() public view returns(address) {
    if (msg.sender == authority[0]) {
        return true; }
        else{
            return false; }
    } 

  function ML(uint value) public {
    actuation = value;
  }

  function get() public constant returns (uint) {
      return actuation;
  }
}
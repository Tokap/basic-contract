pragma solidity ^0.4.0;
// Simple Example
contract PayableContract{
  // You Will Not Receive Feedback on a Setter, Because The Transaction Needs to Be Mined First
  function receiveFunds() payable {}

  function getter() constant returns(uint) {
    return this.balance;
  }
}

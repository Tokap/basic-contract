pragma solidity ^0.4.0;

contract CallerContract {
  CalledContract toBeCalled = new CalledContract();

  /* You can reference an existing block chain instance as shown below */
  /* CalledContract toBeCalled = CalledContract(blockChainAddress); */

  function getNumber() constant returns(uint) {
    return toBeCalled.getNumber();
  }

  function getWords() constant returns(bytes32) {
    return toBeCalled.getWords();
  }
}

contract CalledContract {
  uint number = 42;
  bytes32 words = "Hello World";

  function getNumber() constant returns(uint) {
    return number;
  }

  function setNumber(uint _number) {
    number = _number
  }

  function getWords() constant returns(bytes32) {
    return words;
  }
}

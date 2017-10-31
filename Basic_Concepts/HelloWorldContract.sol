pragma solidity ^0.4.0;

contract HelloWorldContract {

  /* State Variables */
  string word = "Hello World";
  /* Poor Man's Getter - Not good for Private*/
  address public issuer;

  /* Constructor - Fn Called at Beginning of Deployment */
  function HelloWorldContract() {
    issuer = msg.sender;
  }

  modifier ifIssuer() {
    if(issuer != msg.sender){
      revert();
    }
    else {
      /* Underscore is Continue */
      _;
    }
  }

  /* using constant declares this function is a getter */
  function getWord() constant returns(string) {
    return word;
  }

  // We can check using a modifier before the fn runs
  function setWord(string newWord) ifIssuer returns(string) {

    word = newWord;
    return "This is the creator";
  }
}

pragma solidity ^0.4.11;

/// @title Simple Contract
contract Agreement {

  struct SingleParty {
    bool canSign;
    uint[] signedTerms; //index value
  }

  struct SingleTerm {
    bytes32 byword;
    address[] signedBy;
  }

  address public initiator;

  SingleTerm[] public terms;

  // Map the address so we can access parties by address throughout contract
  mapping(address => SingleParty) public parties;

  function inviteToSign(address party) {
    // Check if requestor is authorized to give permission
    require(msg.sender == chairperson);
    parties[party].canSign = true
  }

  function vote(uint termIdx) {
    SingleParty storage sender = parties[msg.sender];
    require(!sender.canSign);
    sender.signedTerms.push(proposal);

    // If `proposal` is out of the range of the array,
    // this will throw automatically and revert all
    // changes.
    terms[termIdx].signedBy.push(sender);
}

}

pragma solidity ^0.4.0;

contract CustodialContract {
  address client;
  bool _switch = false;

  event UpdateStatus(string _msg);
  event UserStatus(string _msg, address user, uint _amount)

  function CustodialContract() {
    client = msg.sender;
  }

  modifier ifClient() {
    if(msg.sender != client){
      revert();
    }
    _;
  }

  function depositFunds() payable {
    UserStatus('User has transferred some money', msg.sender, msg.value);
  }

  function withdrawFunds(uint amount) ifClient {
    if(client.send(amount)) {
      UserStatus('User has withdrawn some money');
      _switch = true;
    }
    else {
      _switch = false;
    }
  }

  function getFunds() ifClient constant returns(uint) {
    return this.balance;
  }
}

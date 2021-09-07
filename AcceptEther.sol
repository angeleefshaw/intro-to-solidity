pragma solidity 0.5.1;

contract AcceptEther {
    mapping(address => uint256) public balances;
    address payable wallet; 

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    function buyToken() public payable {
        //increments senders balance by 1 when the function is called
        balances[msg.sender] += 1;

        //send ether to wallet
        wallet.transfer(msg.value);
    }
}
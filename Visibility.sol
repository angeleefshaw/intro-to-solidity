pragma solidity ^0.6.0;

contract VisibilityExamples {

    uint256 public publicNumber;
    string externalString;

    //All access function but can be costly since all arguments are written to memory 
    function storePublicNumber(uint _publicNumber) public {
        publicNumber = _publicNumber;
    }

    //Cannot be accessed internally, only externally. Cheaper since arguments are stored in calldata
    function storeExternalString(string calldata _externalString) external {
        externalString = _externalString;
    }
}
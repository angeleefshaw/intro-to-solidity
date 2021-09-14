pragma solidity ^0.6.0;

contract VisibilityExamples {

    uint256 public publicNumber;
    uint256 private privateNumber;
    string externalString;
    bool internal internalBool;

    //Can only be called from withing this contract and any derived contracts
    function storeInternalBool(bool _internalBool) internal {
        internalBool = _internalBool;
    }

    //All access function but can be costly since all arguments are written to memory 
    function storePublicNumber(uint _publicNumber) public {
        storeInternalBool(_publicNumber < 1);
        publicNumber = _publicNumber;
    }

    //Cannot be accessed internally, only externally. Cheaper since arguments are stored in calldata
    function storeExternalString(string calldata _externalString) external {
        externalString = _externalString;
    }

    //Can only be called by the main contract and not derived contracts
    function storePrivateNumber(uint256 _privateNumber) private {
        privateNumber = _privateNumber;
    }
}
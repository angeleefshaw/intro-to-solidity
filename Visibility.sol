pragma solidity ^0.6.0;

contract VisibilityExamples {

    //if no visibility is set, the visibility is automatically set to internal
    uint256 public publicNumber;
    uint256 private privateNumber;
    string externalString;
    bool internal internalBool;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People public person = People({favoriteNumber: 2, name: "Angelee"});

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

    //view functions used to simply read off the blockchain without changing any variables state.  
    function retrieve() public view returns(uint256) {
        return publicNumber;
    }

    //pure functions ensure no state will be read or changed 
    function retrievePurely(uint256 favoriteNumber, uint256 i, uint256 j) public pure returns(uint256) {
        //notice no state is saved anywhere
        favoriteNumber * 10;
        return i + j;
    } 
}
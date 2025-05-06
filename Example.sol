// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SolidityBasicsDemo {
    // ---------- STORAGE (Persistent) ----------
    uint public storedNumber; // value type (storage)
    string public storedName; // reference type (storage)
    address public owner;     // set on deployment

    // Mapping (reference type in storage)
    mapping(address => uint) public balances;

    // Struct (group of data)
    struct User {
        string name;
        uint age;
    }

    // ---------- Constructor ----------
    constructor() {
        owner = msg.sender;
    }

    // ---------- VISIBILITY EXAMPLES ----------

    // Public: Can be called by anyone
    function setNumber(uint _num) public {
        storedNumber = _num;
    }

    // Private: Only callable within this contract
    function privateHelper(uint _x) private pure returns (uint) {
        return _x + 10;
    }

    // Internal: Callable within this + inherited contracts
    function internalHelper(uint _x) internal pure returns (uint) {
        return _x * 2;
    }

    // External: Must be called from outside (not inside contract directly)
    function externalFunction(string calldata _greeting) external pure returns (string calldata) {
        return _greeting;
    }

    // ---------- MODIFIER EXAMPLES ----------

    // Pure: No access to contract state
    function addPure(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    // View: Read from contract state
    function getStoredName() public view returns (string memory) {
        return storedName;
    }

    // Payable: Accepts ETH
    function fundMe() public payable {
        balances[msg.sender] += msg.value;
    }

    // ---------- STORAGE vs MEMORY vs CALLDATA ----------

    // Memory: temporary reference type
    function updateName(string memory _newName) public {
        storedName = _newName;
    }

    // Calldata: cheaper, read-only input
    function greetWithCalldata(string calldata _input) external pure returns (string calldata) {
        return _input;
    }

    // ---------- Access Control Demo ----------
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner!");
        _;
    }

    function ownerOnlyFunction() public onlyOwner {
        // logic restricted to contract deployer
        storedNumber = 999;
    }

    // ---------- Struct Example ----------
    User public demoUser;

    function setUser(string memory _name, uint _age) public {
        demoUser = User(_name, _age);
    }
}

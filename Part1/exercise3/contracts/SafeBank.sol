/*To mitigate the improper input validation in "UnsafeBank" contract,
the "SafeBank" contract is implemented with the following changes:

1. The "onlyAuth" modifier is added to the "deposit" function to restrict the deposit function to only authorized users.
2. Owner can authorize and revoke authorization of other users.
3. The "noReentrant" modifier is added to the "withdraw" function to prevent re-entrancy attacks.

*/

// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.20;

contract SafeBank{

    mapping(address => uint256) public balances;
    mapping(address => bool) private auth;
    bool internal locked;

    modifier noReentrant() {
        require(!locked, "No re-entrancy");
        locked = true;
        _;
        locked = false;
    }

    modifier onlyAuth() {
        require(auth[msg.sender], "Not authorized");
        _;
    }

    function deposit(address _for) public payable onlyAuth {
        require(_for != address(0), "Invalid address");
        balances[_for] += msg.value;
    }

    function authorize(address _addr) public onlyAuth {
        auth[_addr] = true;
    }

    function revokeAuthorization(address _addr) public onlyAuth {
        auth[_addr] = false;
    }

    function withdraw(address from, uint256 amount) public payable onlyAuth noReentrant {
        require(from != address(0), "Invalid address");
        require(balances[msg.sender] >= amount, "insufficient balance");
        require(amount > 0, "Invalid amount");

        balances[msg.sender] -= amount;

        // transfer is used instead of call 
        /*Few reasons why low-level call is not recommended
        Reverts are not bubbled up
        Type checks are bypassed
        Function existence checks are omitted
        */
        payable(msg.sender).transfer(amount);
    }
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
/*The vulnerability in UnsafeBallot can be mitigated by using ERC20 votes
which is a regular ERC20 token with snapshot and delegated voting abilities.
Token holders can delegate their votes to other addresses, which can then
vote on their behalf. This allows for a more secure voting mechanism, as
the token holder can delegate their votes to a trusted party, and the
trusted party can vote on their behalf. This is a more secure way to    
implement voting, as it prevents the same address from voting twice, and
also allows for a more secure voting mechanism.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";

contract SafeBallot is ERC20Votes {
    uint256 public proposal1VoteCount;
    uint256 public proposal2VoteCount;

    mapping(address => bool) public alreadyVoted;

    constructor() ERC20("GovernanceToken", "GTK") EIP712("GovernanceToken", "0.1") {
        _mint(msg.sender, 100 * 10 ** 18);
    }

    modifier notAlreadyVoted() {
        require(!alreadyVoted[msg.sender], "already voted");
        _;
        alreadyVoted[msg.sender] = true;
    }

    function voteFor1() external notAlreadyVoted(){
        delegate(msg.sender);
        proposal1VoteCount += 1;
    }

    function voteFor2() external notAlreadyVoted(){
        delegate(msg.sender);
        proposal2VoteCount += 1;
    }
}

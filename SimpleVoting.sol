// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleVoting {
    struct Proposal {
        string name;
        uint256 voteCount;
    }

    address public chairperson;
    Proposal[] public proposals;
    mapping(address => bool) public hasVoted;

    constructor(string[] memory proposalNames) {
        chairperson = msg.sender;
        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({name: proposalNames[i], voteCount: 0}));
        }
    }

    function vote(uint256 proposalIndex) external {
        require(!hasVoted[msg.sender], "Already voted");
        require(proposalIndex < proposals.length, "Invalid proposal");
        hasVoted[msg.sender] = true;
        proposals[proposalIndex].voteCount++;
    }

    function getProposalCount() external view returns (uint256) {
        return proposals.length;
    }
}

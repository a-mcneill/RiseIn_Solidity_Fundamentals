/*
This contract is a simple voting system for proposals created by the owner.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ProposalContract {

    // Counter to track of the IDs
    uint256 private counter;

    struct Proposal {
        
        // Title of proposal
        string title;
        // Description of proposal
        string description;
        // Number of approve votes
        uint256 approve;
        // Number of reject votes
        uint256 reject;
        // Number of pass votes
        uint256 pass;
        // Total vote to end when this limit is reached
        uint256 total_vote_to_end;
        // Current state whether it will pass or fail
        bool current_state;
        // status whether active and others can vote to contract
        bool is_active;

    }

    // Recording of previous proposals
    mapping(uint256 => Proposal) proposal_history;

    // Function to create proposals
    function create(string calldata _title, string calldata _description, uint256 _total_vote_to_end) external {
        counter += 1;

        proposal_history[counter] = Proposal(_title, _description, 0, 0, 0, _total_vote_to_end, false, true);

    }


}

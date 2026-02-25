/*
This contract is a simple voting system for proposals created by the owner.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ProposalContract {

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
        // Total vote to end
        uint256 total_vote_to_end;
        // Current state
        bool current_state;
        // status - active
        bool is_active;

    }

    // Recording of previous proposals
    mapping(uint256 => Proposal) proposal_history;


}
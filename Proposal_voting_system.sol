/*
This contract is a simple voting system for proposals created by the owner.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ProposalContract {

    // ******* Data *******
    
    // set only owner can create proposals
    address owner;

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

    
    // Check if voter has voted on proposal already
    address [] private voted_addresses;

    // set the owner as contract deployer
    constructor() {
        owner = msg.sender;
        voted_addresses.push(msg.sender);
    }

    // Modifier to ensure only owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can create proposals.");
        _;
    }

    // Modifier to ensure proposal is active
    modifier active() {
        require(proposal_history[counter].is_active == true, "The proposal is not active.");
        _;
    }

    // Modifier to ensure new voter
    modifier newVoter(address _address) {
        require(!isVoted(_address), "Address has already voted.");
        _;
    }

    
    // ******* Execute Functions *******

    // Function to set owner
    function setOwner(address new_owner) external onlyOwner {
        owner = new_owner;
    }
    
    
    // Function to create proposals
    function create(string calldata _title, string calldata _description, uint256 _total_vote_to_end) external onlyOwner {
        counter += 1;

        proposal_history[counter] = Proposal(_title, _description, 0, 0, 0, _total_vote_to_end, false, true);
    }


    // Function to calculate current state
    function calculateCurrentState() private view returns(bool) {
        
        Proposal storage proposal = proposal_history[counter];

        uint256 approve = proposal.approve;
        uint256 reject = proposal.reject;
        uint256 pass = proposal.pass;

        // Calculate total vote to implement function to approve proposal if >= 51% of the vote
        uint256 total_vote = proposal.approve + proposal.reject + proposal.pass;

        if (approve * 100 >= total_vote * 51) {
            return true;
        }
        else {
            return false;
        }
    }
    
    
    // Function to vote
    function vote(uint8 choice) external active newVoter(msg.sender) {

        // Storage variable for mapping to history
        Proposal storage proposal = proposal_history[counter];
        uint256 total_vote = proposal.approve + proposal.reject + proposal.pass;

        voted_addresses.push(msg.sender);

        // Increment vote count as per vote
        if (choice == 1) {
            proposal.approve += 1;
            proposal.current_state = calculateCurrentState();
        }

        else if (choice == 2) {
            proposal.reject += 1;
            proposal.current_state = calculateCurrentState();
        }

        else if (choice == 0) {
            proposal.pass += 1;
            proposal.current_state = calculateCurrentState();
        }

        // Check vote count to confim count until total_vote_to_end
        if ((proposal.total_vote_to_end - total_vote == 1) && (choice == 1 || choice == 2 || choice == 0)) {
            proposal.is_active = false;
            voted_addresses = [owner];
        }
    
    }




}

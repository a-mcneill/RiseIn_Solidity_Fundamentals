# RiseIn_Solidity_Fundamentals

This reporistory contains my work for the **Solidity Fundamentals** course by Rise In. It includes foundational smart-contract exercises as well as the final project:
a fully functional **Proposal Voting System** deployed on the Sepolia test network.

## Repository Structure

```
RiseIn_Solidity_Fundamentals/
├── Counter_Task1.sol
├── Proposal_voting_system.sol
└── README.md
```

---

## Counter Task (Task 1)
`Counter_Task1.sol` implements a basic counter with:

- Owner-only increment and decrement
- A `Counter` struct storing a number and description
- Getter functions for both fields
- Constructor-based initialisation.

This task demonstrates fundamental solidity concepts such as modifiers, access control, and state updates.

---

## Final Project - Proposal Voting System

`Proposal_voting_system.sol` is a more advanced smart contract implementing a decentralised proposal voting mechanism.

### Key Features:

- **Owner-created proposals** with title, description, and vote limit.
- **Three voting options:**
  - `0` -> pass
  - `1` -> approve
  - `2` -> reject
- **Automatic state calculation** (proposal passes if approvals >= 51%
- **Duplicate-vote prevention** using an address registry
- **Automatic proposal closure** when vote limit is reached
- **Manual termination** by the owner
- **Query functions:**
  - `isVoted(address)`
  - `getCurrentProposal()`
  - `getProposal(id)`


 ---

 ## Deployment Details

 - **Network:** Sepolia Testnet
 - **Tools:** Remix IDE + MetaMask
 - **Contract Address:**
  - `0xB2A8A8ef8ee03e679D2fEEe089182462a7cCe447`


---

## Verification

The contract was successfully verified on **Blockscout/Sourcify**, allowing public inspection of the source code.


---

## Testing Summary
- Created a proposal on Sepolia
- Connected a second Metamask account
- Cast a vote using the second account
- Observed correct state update via `getCurrentProposal()`
- Confirmed vote counting, state calculation, and proposal closure logic with all functioning as intended.


---



   

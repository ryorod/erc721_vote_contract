// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.21;

/// @author ryorod

import "./base/ERC721VotesDrop.sol";

contract MembersNFT is ERC721VotesDrop {
	constructor(
		address _defaultAdmin,
        string memory _name,
        string memory _symbol,
        address _royaltyRecipient,
        uint128 _royaltyBps,
        address _primarySaleRecipient
	) ERC721VotesDrop(
		_defaultAdmin, _name, _symbol, _royaltyRecipient, _royaltyBps, _primarySaleRecipient
	) {
		nextTokenIdToLazyMint = _startTokenId();
	}

	function _startTokenId() internal pure virtual override returns (uint256) {
        return 1;
    }

	function clock() public view virtual override returns (uint48) {
        return SafeCast.toUint48(block.timestamp);
    }

	function CLOCK_MODE() public view virtual override returns (string memory) {
        require(clock() == block.timestamp, "Votes: broken clock mode");
        return "mode=timestamp";
    }
}
// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.9.0) (token/ERC721/extensions/ERC721Votes.sol)
// updated by ryorod with ERC721A imported from thirdweb contracts.

pragma solidity ^0.8.21;

import { ERC721A } from "@thirdweb-dev/contracts/eip/ERC721AVirtualApprove.sol";
import "@openzeppelin/contracts/governance/utils/Votes.sol";

import { Context as ContextTW } from "@thirdweb-dev/contracts/external-deps/openzeppelin/utils/Context.sol";
import { Context as ContextOZ } from "@openzeppelin/contracts/utils/Context.sol";

abstract contract ERC721AVotes is ERC721A, Votes {
    /**
     * @dev See {ERC721A-_afterTokenTransfers}. Adjusts votes when tokens are transferred.
     *
     * Emits a {IVotes-DelegateVotesChanged} event.
     */
    function _afterTokenTransfers(
        address from,
        address to,
        uint256 startTokenId,
        uint256 quantity
    ) internal virtual override {
        _transferVotingUnits(from, to, quantity);
        super._afterTokenTransfers(from, to, startTokenId, quantity);
    }

    /**
     * @dev Returns the balance of `account`.
     *
     * WARNING: Overriding this function will likely result in incorrect vote tracking.
     */
    function _getVotingUnits(address account) internal view virtual override returns (uint256) {
        return balanceOf(account);
    }

	function _msgSender() internal view virtual override(ContextOZ, ContextTW) returns (address) {
        return super._msgSender();
    }

    function _msgData() internal view virtual override(ContextOZ, ContextTW) returns (bytes calldata) {
        return super._msgData();
    }
}
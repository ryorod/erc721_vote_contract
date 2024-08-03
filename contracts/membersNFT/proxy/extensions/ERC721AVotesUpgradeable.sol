// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@thirdweb-dev/contracts/eip/ERC721AVirtualApproveUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/governance/utils/VotesUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

abstract contract ERC721AVotesUpgradeable is Initializable, ERC721AUpgradeable, VotesUpgradeable {
	function __ERC721AVotes_init() internal onlyInitializing {
    }

    function __ERC721AVotes_init_unchained() internal onlyInitializing {
    }

    /**
     * @dev Returns the balance of `account`.
     *
     * WARNING: Overriding this function will likely result in incorrect vote tracking.
     */
    function _getVotingUnits(address account) internal view virtual override returns (uint256) {
        return balanceOf(account);
    }

	/**
     * @dev See {ERC721-_afterTokenTransfers}. Adjusts votes when tokens are transferred.
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
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
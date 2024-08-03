// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.21;

/// @author ryorod
/// @notice ERC721DropPermissionsEnumerable with Votes extension.

import "./ERC721DropPermissionsEnumerable.sol";
import "../extensions/ERC721AVotes.sol";

contract ERC721VotesDrop is ERC721DropPermissionsEnumerable, ERC721AVotes {
	constructor(
		address _defaultAdmin,
        string memory _name,
        string memory _symbol,
        address _royaltyRecipient,
        uint128 _royaltyBps,
        address _primarySaleRecipient
	) ERC721DropPermissionsEnumerable(
		_defaultAdmin, _name, _symbol, _royaltyRecipient, _royaltyBps, _primarySaleRecipient
	) EIP712(_name, "1") {}

	function _afterTokenTransfers(
        address from,
        address to,
        uint256 startTokenId,
        uint256 quantity
    ) internal virtual override(ERC721A, ERC721AVotes) {
		super._afterTokenTransfers(from, to, startTokenId, quantity);		
	}

	function tokenURI(uint256 _tokenId) public view virtual override(ERC721A, ERC721DropPermissionsEnumerable) returns (string memory) {
        return super.tokenURI(_tokenId);
    }

	function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721A, ERC721DropPermissionsEnumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

	function _beforeTokenTransfers(
        address from,
        address to,
        uint256 startTokenId,
        uint256 quantity
    ) internal virtual override(ERC721A, ERC721DropPermissionsEnumerable) {
        super._beforeTokenTransfers(from, to, startTokenId, quantity);
    }

	function _msgSender()
        internal
        view
        virtual
        override(ERC721AVotes, ERC721DropPermissionsEnumerable)
        returns (address)
    {
        return super._msgSender();
    }

	function _msgData()
        internal
        view
        virtual
        override(ERC721AVotes, ERC721DropPermissionsEnumerable)
        returns (bytes calldata)
    {
        return super._msgData();
    }
}
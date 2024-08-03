// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.21;

import "./prebuilts/DropERC721VirtualTokenURI.sol";
import "./extensions/ERC721AVotesUpgradeable.sol";

contract DropERC721Votes is DropERC721VirtualTokenURI, ERC721AVotesUpgradeable {
	constructor() initializer {
		nextTokenIdToLazyMint = _startTokenId();
	}

	function _startTokenId() internal pure virtual override returns (uint256) {
        return 1;
    }

	function clock() public view virtual override returns (uint48) {
        return SafeCastUpgradeable.toUint48(block.timestamp);
    }

    function CLOCK_MODE() public view virtual override returns (string memory) {
		require(clock() == block.timestamp, "Votes: broken clock mode");
        return "mode=timestamp";
    }

	function _afterTokenTransfers(
        address from,
        address to,
        uint256 startTokenId,
        uint256 quantity
    ) internal virtual override(ERC721AUpgradeable, ERC721AVotesUpgradeable) {
		super._afterTokenTransfers(from, to, startTokenId, quantity);		
	}

	function tokenURI(uint256 _tokenId) public view virtual override(ERC721AUpgradeable, DropERC721VirtualTokenURI) returns (string memory) {
        return super.tokenURI(_tokenId);
    }

	function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721AUpgradeable, DropERC721VirtualTokenURI)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

	function _beforeTokenTransfers(
        address from,
        address to,
        uint256 startTokenId,
        uint256 quantity
    ) internal virtual override(ERC721AUpgradeable, DropERC721VirtualTokenURI) {
        super._beforeTokenTransfers(from, to, startTokenId, quantity);
    }

	function _msgSender()
        internal
        view
        virtual
        override(ContextUpgradeable, DropERC721VirtualTokenURI)
        returns (address sender)
    {
        return super._msgSender();
    }

	function _msgData()
        internal
        view
        virtual
        override(ContextUpgradeable, DropERC721VirtualTokenURI)
        returns (bytes calldata)
    {
        return super._msgData();
    }
}
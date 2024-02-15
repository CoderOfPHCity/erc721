// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyNFT {

    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _tokenApprovals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;


    function mint(address to, uint256 tokenId) public {
        require(to != address(0), "ERC721: mint to the zero address");
        require(!_exists(tokenId), "ERC721: token already minted");

        _balances[to]++;
        _owners[tokenId] = to;
    }

    function _exists(uint256 tokenId) internal view returns (bool) {
        return _owners[tokenId] != address(0);
    }

    function transfer(address from, address to, uint256 tokenId) public {
        require(from == _owners[tokenId], "ERC721: transfer of token that is not owned");
        require(to != address(0), "ERC721: transfer to the zero address");

        _transfer(from, to, tokenId);

    }

    function _transfer(address from, address to, uint256 tokenId) internal {
        _owners[tokenId] = to;
        _balances[from]--;
        _balances[to]++;

    }

    // Function to get the owner of a token
    function ownerOf(uint256 tokenId) public view returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "ERC721: owner query for nonexistent token");
        return owner;
    }
}

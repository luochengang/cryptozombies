// SPDX-License-Identifier: MIT
// CryptoZombies Contracts

pragma solidity ^0.8.0;

import "./zombieattack.sol";
import "./erc721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {

  // tokenId => 被授权的账户
  mapping (uint => address) zombieApprovals;

  function balanceOf(address _owner) public view override returns (uint256 _balance) {
    require(_owner != address(0), "ERC721: address zero is not a valid owner");
    return ownerZombieCount[_owner];
  }

  function ownerOf(uint256 _tokenId) public view override returns (address _owner) {
    _owner = zombieToOwner[_tokenId];
    require(_owner != address(0), "ERC721: invalid token ID");
    return _owner;
  }

  function _transfer(address _from, address _to, uint256 _tokenId) private {
    ownerZombieCount[_to]++;
    ownerZombieCount[_from]--;
    zombieToOwner[_tokenId] = _to;
    emit Transfer(_from, _to, _tokenId);
  }

  function transfer(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) override {
    _transfer(msg.sender, _to, _tokenId);
  }

  function approve(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) override {
    address _owner = ownerOf(_tokenId);
    require(_to != _owner, "ERC721: approval to current owner");

    zombieApprovals[_tokenId] = _to;
    emit Approval(msg.sender, _to, _tokenId);
  }

  function takeOwnership(uint256 _tokenId) public override {
    require(zombieApprovals[_tokenId] == msg.sender);
    address owner = ownerOf(_tokenId);
    _transfer(owner, msg.sender, _tokenId);
  }
}

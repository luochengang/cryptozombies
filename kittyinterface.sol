// SPDX-License-Identifier: MIT
// CryptoZombies Contracts

pragma solidity ^0.8.0;

contract KittyInterface {
  function getKitty(uint256 _id) external view returns (
    bool isGestating,
    bool isReady,
    uint256 cooldownIndex,
    uint256 nextActionAt,
    uint256 siringWithId,
    uint256 birthTime,
    uint256 matronId,
    uint256 sireId,
    uint256 generation,
    uint256 genes
  ) {
      return (true, true, 1, 1, 1, 1, 1, 1, 1, genes);
  }
}
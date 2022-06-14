pragma solidity ^0.4.19;

contract KittyInterface {

 mapping(uint => uint) kitties;
  
  function getKitty(uint256 _id) external view returns (uint) {
      return kitties[_id];
  }

  function setKitty(uint256 _id) external {
    kitties[_id] = _id;
  }

}
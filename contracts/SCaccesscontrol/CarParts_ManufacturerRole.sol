pragma solidity >=0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'CarParts_ManufacturerRole' to manage this role - add, remove, check
contract CarParts_ManufacturerRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event CarParts_ManufacturerAdded(address indexed account);
  event CarParts_ManufacturerRemoved(address indexed account);

  // Define a struct 'CarParts_Manufacturers' by inheriting from 'Roles' library, struct Role
  Roles.Role private carParts_Manufacturers;

  // In the constructor make the address that deploys this contract the 1st CarParts_Manufacturer
  constructor() public {
    _addCarParts_Manufacturer(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyCarParts_Manufacturer() {
    require(isCarParts_Manufacturer(msg.sender));
    _;
  }

  // Define a function 'isCarParts_Manufacturer' to check this role
  function isCarParts_Manufacturer(address account) public view returns (bool) {
    return carParts_Manufacturers.has(account);
  }

  // Define a function 'addCarParts_Manufacturer' that adds this role
  function addCarParts_Manufacturer(address account) public onlyCarParts_Manufacturer {
    _addCarParts_Manufacturer(account);
  }

  // Define a function 'renounceCarParts_Manufacturer' to renounce this role
  function renounceCarParts_Manufacturer() public {
    _removeCarParts_Manufacturer(msg.sender);
  }

  // Define an internal function '_addCarParts_Manufacturer' to add this role, called by 'addCarParts_Manufacturer'
  function _addCarParts_Manufacturer(address account) internal {
    carParts_Manufacturers.add(account);
    emit CarParts_ManufacturerAdded(account);
  }

  // Define an internal function '_removeCarParts_Manufacturer' to remove this role, called by 'removeCarParts_Manufacturer'
  function _removeCarParts_Manufacturer(address account) internal {
    carParts_Manufacturers.remove(account);
    emit CarParts_ManufacturerRemoved(account);
  }
}


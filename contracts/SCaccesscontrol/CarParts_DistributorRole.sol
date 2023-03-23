pragma solidity >=0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'CarParts_DistributorRole' to manage this role - add, remove, check
contract CarParts_DistributorRole {
  using Roles for Roles.Role;
  // Define 2 events, one for Adding, and other for Removing
  event CarParts_DistributorAdded(address indexed account);
  event CarParts_DistributorRemoved(address indexed account);
  // Define a struct 'CarParts_distributors' by inheriting from 'Roles' library, struct Role
  Roles.Role private CarParts_distributors;
  // In the constructor make the address that deploys this contract the 1st CarParts_distributor
  constructor() public {
    _addCarParts_Distributor(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyCarParts_Distributor() {
    require(isCarParts_Distributor(msg.sender));
    _;
  }

  // Define a function 'isCarParts_Distributor' to check this role
  function isCarParts_Distributor(address account) public view returns (bool) {
    return CarParts_distributors.has(account);
  }

  // Define a function 'addCarParts_Distributor' that adds this role
  function addCarParts_Distributor(address account) public onlyCarParts_Distributor {
    _addCarParts_Distributor(account);
  }

  // Define a function 'renounceCarParts_Distributor' to renounce this role
  function renounceCarParts_Distributor() public {
    _removeCarParts_Distributor(msg.sender);
  }

  // Define an internal function '_addCarParts_Distributor' to add this role, called by 'addCarParts_Distributor'
  function _addCarParts_Distributor(address account) internal {
    CarParts_distributors.add(account);
    emit CarParts_DistributorAdded(account);
  }

  // Define an internal function '_removeCarParts_Distributor' to remove this role, called by 'removeCarParts_Distributor'
  function _removeCarParts_Distributor(address account) internal {
    CarParts_distributors.remove(account);
    emit CarParts_DistributorRemoved(account);
  }
}
// SPDX Licence-Identifier: MIT
pragma solidity 0.8.6;

import { ClaimManager as TrustedClaimManager } from "@energyweb/iam-contracts/dist/contracts/roles/ClaimManager.sol";


library RolesLibrary {

    function hasRole(
        address _userAddress,
        address _claimManagerAddress,
        bytes32[] memory _roles
    ) internal view returns (bool) {
        if (_roles.length == 0) {
            return true;
        }
        TrustedClaimManager claimManager = TrustedClaimManager(_claimManagerAddress);
        for (uint i = 0; i < _roles.length; i++) {
            if (claimManager.hasRole(_userAddress, _roles[i], 0)) {
                return true;
            }
        }
        return false;
    }
}

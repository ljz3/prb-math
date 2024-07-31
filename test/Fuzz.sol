// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@perimetersec/fuzzlib/src/FuzzBase.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";
import "src/Common.sol";

/**
 * @title Fuzz
 * @author 0xScourgedev
 * @notice Fuzz contract to test the equivalence of both solidity
 */
contract Fuzz is FuzzBase {
    using Strings for int256;

    function test_checkSolidityEquivalence(int256 x, int256 y, int256 denominator) public {
        x * y; // To avoid over/underflows, since this will revert if it's too large/small
        int256 expectedValue = getEquivalenceValue(x, y, denominator);
        int256 actualValue = mulDivSigned(x, y, denominator);

        log("expected", expectedValue);
        log("actual  ", actualValue);
        assert(expectedValue == actualValue);
    }

    function getEquivalenceValue(int256 x, int256 y, int256 denominator) private returns (int256) {
        string[] memory inputs = new string[](5);
        inputs[0] = "python3";
        inputs[1] = "test/python/equivalence.py";
        inputs[2] = x.toStringSigned();
        inputs[3] = y.toStringSigned();
        inputs[4] = denominator.toStringSigned();

        bytes memory result = vm.ffi(inputs);

        return abi.decode(result, (int256));
    }
}

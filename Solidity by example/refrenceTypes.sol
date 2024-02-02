// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract ReferenceTypesExample {
    // Value type
    struct ValueStruct {
        uint256 intValue;
        bool boolValue;
    }

    // Reference type (contains an array, which is a reference type)
    struct ReferenceStruct {
        uint256 intValue;
        uint[] referenceArray;
    }

    ValueStruct public valueStructInstance;
    ReferenceStruct public referenceStructInstance;

    // Function modifying a struct with value types
    function modifyValueStruct(uint256 newValue, bool newBool) public {
        valueStructInstance.intValue = newValue;
        valueStructInstance.boolValue = newBool;
    }

    // Function modifying a struct with a reference type (array)
    function modifyReferenceStruct(uint256 newValue) public {
        referenceStructInstance.intValue = newValue;
        referenceStructInstance.referenceArray.push(newValue);
    }
}

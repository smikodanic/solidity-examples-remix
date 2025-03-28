// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataLocationMemory_String {
    string private name = 'John'; // public, internal (default), private 


    /*** memory assgined from memory ***/
    // string behaves as Value Type
    function m2m_string() external pure returns (string memory, string memory) {
        string memory a = 'A'; 
        string memory b = a; // b is reference to a
        b = 'B'; // When a literal is assigned to string a new string value is created, so it's value copy. It's like b = string('B')
        return (a, b); // (A, B)
    }


    // string used as array of characters is a Reference Type
    function m2m_stringArr() external pure returns (string memory, string memory){
        string memory str1 = "hello";
        string memory str2 = str1; // str2 now references the same string in memory

        // Modifying str2 (array member) will also change str1
        bytes memory str2Bytes = bytes(str2); // convert string to array of chars
        str2Bytes[0] = 'H'; // Modifies the first character of both str1 and str2

        // Now, both str1 and str2 will be "Hello"
        return (str1, str2); // (Hello, Hello)
    }



    /*** memory assigned from storage ***/
    function m2storage() external view returns (string memory, string memory) {
        string memory a = name; // memory assigned from storage
        a = 'Eva'; // will not change 'name' in the storage
        return (a, name); // (Eva, John)
    }

    function getName() external view returns (string memory) {
        return name;
    }



    /*** memory assigned from calldata ***/
    function m2calldata(string calldata company) external pure returns (string memory, string memory, bytes memory, string memory) {
        string memory myCompany = company; // memory assigned from calldata
        myCompany = "Ethy LLC"; // will not change 'company' in the calldata
        string memory msg_data = abi.decode(msg.data[4:], (string));
        return (myCompany, company, msg.data, msg_data);
    }

    function getCalldata() external pure returns (bytes calldata) {
        return msg.data;
    }



}
// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Mapping2Eg {

    mapping(address => uint) public balanceReceived;

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdrawAllMoney(address payable _to) public {
        uint balanceToSendOut = balanceReceived[msg.sender];
        // require(balanceToSendOut > 0, "No funds to withdraw");

        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSendOut);
        // (bool success, ) = payable(msg.sender).call{value: balanceToSendOut}("");
        // require(success, "Transfer failed");
    }
}

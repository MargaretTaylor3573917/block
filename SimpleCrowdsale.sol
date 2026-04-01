// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
}

contract SimpleCrowdsale {
    address public token;
    address public owner;
    uint256 public rate;
    uint256 public endTime;

    constructor(address _token, uint256 _rate, uint256 _duration) {
        owner = msg.sender;
        token = _token;
        rate = _rate;
        endTime = block.timestamp + _duration;
    }

    function buyTokens() external payable {
        require(block.timestamp < endTime, "Crowdsale ended");
        uint256 amount = msg.value * rate;
        IERC20(token).transfer(msg.sender, amount);
    }

    function withdraw() external {
        require(msg.sender == owner, "Only owner");
        payable(owner).transfer(address(this).balance);
    }
}

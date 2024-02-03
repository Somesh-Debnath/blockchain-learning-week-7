contract UnsafeBank {
    mapping(address => uint256) public balances;

    // allow depositing on other's behalf
    function deposit(address _for) public payable {
        balances[_for] += msg.value;
    }

    function withdraw(address from, uint256 amount) public {
        require(balances[from] <= amount, "insufficient balance");

        balances[from] -= amount;
        msg.sender.call{value: amount}("");
    }
}
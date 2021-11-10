pragma solidity ^0.4.24;

interface IERC20 {
    function transfer(address to, uint256 value) external;
    function transferFrom(address from, address to, uint256 value) external;
    function balanceOf(address tokenOwner)  external returns (uint balance);

}

contract Bulksender{
    address owner;
    event Multisend (address _token,uint _num, uint _total);
    
    constructor() public {
        owner = msg.sender;
    }
    function multisendToken(address _token, address[] _contributors,uint256 _balance) public {
        uint256 total = 0;
        require (owner == msg.sender);
        IERC20 erc20token = IERC20(_token);
        uint balanceToDistribute = erc20token.balanceOf(address(this));
        require(_contributors.length * _balance <= balanceToDistribute,"Not enough balance to distribute");

        uint8 i = 0;
        for (i; i < _contributors.length; i++) {
            erc20token.transfer(_contributors[i], _balance);
            total += _balance;
        }
        emit Multisend (_token, _contributors.length,total);
    }

    function getTokensBack (address _token) public {
        require(owner == msg.sender);
        IERC20 erc20token = IERC20(_token);
        erc20token.transfer(msg.sender, erc20token.balanceOf(address(this)));
    }
    
    function getOwner() public view returns(address) {
        return owner;
    }
    
    function killContract() public {
        require(owner == msg.sender);
        selfdestruct(owner);
    }
    

}
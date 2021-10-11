
/*

HODL.Finance is built upon the CeDeFi fundamentals of reflection and a nonprofit foundation.
The $HFT token is the utility token for the HODL.finance ecosystem.

HODL.Finance features:
   1.) 10% is charged from every transaction.
   2.) 2% of which is redistributed to the holders.
   3.) 2% is used for the sustainability of the LP till 2500 $BNB after going to a marketing treasury.
   4.) 6% is going to a nonprofit foundation for ecosystem innovation.

 /$$   /$$  /$$$$$$  /$$$$$$$  /$$       /$$$$$$$$ /$$$$$$ /$$   /$$  /$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$$
| $$  | $$ /$$__  $$| $$__  $$| $$      | $$_____/|_  $$_/| $$$ | $$ /$$__  $$| $$$ | $$ /$$__  $$| $$_____/
| $$  | $$| $$  \ $$| $$  \ $$| $$      | $$        | $$  | $$$$| $$| $$  \ $$| $$$$| $$| $$  \__/| $$
| $$$$$$$$| $$  | $$| $$  | $$| $$      | $$$$$     | $$  | $$ $$ $$| $$$$$$$$| $$ $$ $$| $$      | $$$$$
| $$__  $$| $$  | $$| $$  | $$| $$      | $$__/     | $$  | $$  $$$$| $$__  $$| $$  $$$$| $$      | $$__/
| $$  | $$| $$  | $$| $$  | $$| $$      | $$        | $$  | $$\  $$$| $$  | $$| $$\  $$$| $$    $$| $$
| $$  | $$|  $$$$$$/| $$$$$$$/| $$$$$$$$| $$       /$$$$$$| $$ \  $$| $$  | $$| $$ \  $$|  $$$$$$/| $$$$$$$$
|__/  |__/ \______/ |_______/ |________/|__/      |______/|__/  \__/|__/  |__/|__/  \__/ \______/ |________/

*/

//SPDX-License-Identifier:Unlicensed
pragma solidity 0.8.4;

interface IERC20 {

    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// https://github.com/binance-chain/bsc-genesis-contract/blob/master/contracts/interface/IBEP20.sol
/**
 * @dev Interface of the BEP20 standard, an extended version of ERC20 and is compatible with BEP2 and ERC20.
 */
interface IBEP20 is IERC20{
  /**
   * @dev Returns the token decimals.
   */
  function decimals() external view returns (uint8);

  /**
   * @dev Returns the token symbol.
   */
  function symbol() external view returns (string memory);

  /**
   * @dev Returns the token name.
   */
  function name() external view returns (string memory);

  /**
   * @dev Returns the bep token owner.
   */
  function getOwner() external view returns (address);
}

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}


abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return payable(msg.sender);
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}

interface IUniswapV2Pair {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint);
    function factory() external view returns (address);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);
    function kLast() external view returns (uint);

    function mint(address to) external returns (uint liquidity);
    function burn(address to) external returns (uint amount0, uint amount1);
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
    function skim(address to) external;
    function sync() external;

    function initialize(address, address) external;
}

interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

contract HFTtoken is Context, IBEP20, Ownable {
    using SafeMath for uint256;

    /******************************************************************
     *          CUSTOM DATA TYPES
     ******************************************************************/
    /*
     * Some wallets are subject for locking of assets for sertain period of time
     * and linear unlocking of particulair amount of asssets later.
     * Unlocking repeats untill the locked balance of the wallet reaches 0
     */
    struct lockedBalanceStruct {
        uint256 rLockedBalance;      // locked balance (tAmount for wallet excluded from fee, rAmount otherwise). decreases after each unlock step
        uint256 nextLockInterval;    // linear multiunlock: duration of single unlocking step
        uint256 lockedUntill;        // moment, utill the wallet is completely locked for transfers
        uint256 rUnlockAmount;       // linear multiunlock: amount of tokens to unlock on each step in rAmount.
                                     // shall be equal to rLockedBalance in case of singleUnlock
    }
    struct rValuesStruct {
        uint256 rAmount;
        uint256 rTransferAmount;
        uint256 rReflection;
        uint256 rLiquidity;
        uint256 rFoundation;
    }
    struct tValuesStruct {
        uint256 tAmount;
        uint256 tTransferAmount;
        uint256 tReflection;
        uint256 tLiquidity;
        uint256 tFoundation;
    }

    /******************************************************************
     *          MAPPINGS
     ******************************************************************/
    mapping (address => uint256) private rOwned;
    mapping (address => uint256) private tOwned;
    mapping (address => mapping (address => uint256)) private allowances;
    mapping (address => lockedBalanceStruct) lockedBalances;
    mapping (address => bool) private isExcludedFromFee;
    mapping (address => bool) private isExcludedFromReward;
    address[] private excludedFromReward;
    address[] private lockedWallets;

    /******************************************************************
     *          CONFIGURATION
     ******************************************************************
    address constant BURN_ADDRESS       = 0x000000000000000000000000000000000000dEaD;
    address constant WALLET_INVESTOR1   = 0xeEaB9b2561773F109444D9629bed9518CE1274A7;
    address constant WALLET_INVESTOR2   = 0x8927F63497080FB284d1aE7d13d6F7b6f4E64bFa;
    address constant WALLET_INVESTOR3   = 0xB487B2249204AF5CEE4411D550a0C24ED62207c1;
    address constant WALLET_INVESTOR4   = 0x84E9f6F1d6E2d7eb1b1F62c57826a89951c17a6B;
    address constant WALLET_INVESTOR5   = 0x013f2c3eDbF7012b06293888F9a7ca5d2545a1Cc;
    address constant WALLET_INVESTOR6   = 0x417fD7fE60EfE2Aed57815C4bB1aF1eE071E7013;
    address constant WALLET_INVESTOR7   = 0x3238Df3F91306e795B58eFd116d10AE7ff53762d;
    address constant WALLET_INVESTOR8   = 0xDc787834614F55Ed8805E6ACc46243459481cF50;
    address constant WALLET_INVESTOR9   = 0xeecb15Ee2332f8fD139CfFB5A4a1835F4414dc27;
    address constant WALLET_INVESTOR10  = 0xfFE6FeBF442Cd060CE41EaCd181494638e63B455;
    address constant WALLET_ADVISORS    = 0x4E147d6C700173EB294e701D088Fb47EC72D05c7;
    address constant WALLET_TEAM        = 0xCE25Cb2dED9062Dd82793b7F7f2Ce8a2c11d4f08;
    address constant WALLET_DEV         = 0x500871fF98A56FE113d343627B910BAA58B9265b;
    address constant WALLET_AIRDROP     = 0xe7A2538C166956E4b9D6efCDBB9D71418fD15B45;
    address constant WALLET_LP_SUPPLY   = 0xC8154413b7d837Ff8bB4e13D9A7C8667423c326B;
    address walletTreasury              = 0x06DA1389306E216dC9Ecf4Ed1a5c65CB278937a1;
    address walletFoundation            = 0x239316cc24973B3AFDEa9Cc2c7Fe86CED685a562;
    address constant PANCAKE_V2_ROUTER_ADDRESS     = 0x10ED43C718714eb63d5aA57B78B54704E256024E;
    string private constant TOKEN_NAME = "HODLFinance";
    string private constant TOKEN_SYMBOL = "HFT";
    uint8 private constant TOKEN_DECIMALS = 9;
    uint256 private constant T_TOTAL = 210000 * 10**6 * 10**TOKEN_DECIMALS;
    uint256 private constant MAX_BNB_TO_ADD_TO_LP = 2200 * 10**18;
    uint256 public constant MAX_TX_AMOUNT = 420 * 10**6 * 10**TOKEN_DECIMALS;
    uint256 private constant NUM_TOKENS_SELL_TO_ADD_TO_LP = 10 * 10**6 * 10**TOKEN_DECIMALS;
    uint256 private constant NUM_TOKENS_SELL_TO_SEND_TO_FOUNDATION = 15 * 10**6 * 10**TOKEN_DECIMALS;
    uint256 private constant MIN_BNB_AMOUNT_TO_SEND_TO_FOUNDATION = 1 * 10**18; //1 bnb
    /*   END OF CONFIGURATION   */

    /******************************************************************
     *          TEST CONFIGURATION
     ******************************************************************/
    address constant BURN_ADDRESS       = 0x000000000000000000000000000000000000dEaD;
    address constant WALLET_INVESTOR1   = 0xeEaB9b2561773F109444D9629bed9518CE1274A7;
    address constant WALLET_INVESTOR2   = 0x8927F63497080FB284d1aE7d13d6F7b6f4E64bFa;
    address constant WALLET_INVESTOR3   = 0xB487B2249204AF5CEE4411D550a0C24ED62207c1;
    address constant WALLET_INVESTOR4   = 0x84E9f6F1d6E2d7eb1b1F62c57826a89951c17a6B;
    address constant WALLET_INVESTOR5   = 0x013f2c3eDbF7012b06293888F9a7ca5d2545a1Cc;
    address constant WALLET_INVESTOR6   = 0x417fD7fE60EfE2Aed57815C4bB1aF1eE071E7013;
    address constant WALLET_INVESTOR7   = 0x3238Df3F91306e795B58eFd116d10AE7ff53762d;
    address constant WALLET_INVESTOR8   = 0xDc787834614F55Ed8805E6ACc46243459481cF50;
    address constant WALLET_INVESTOR9   = 0xeecb15Ee2332f8fD139CfFB5A4a1835F4414dc27;
    address constant WALLET_INVESTOR10  = 0xfFE6FeBF442Cd060CE41EaCd181494638e63B455;
    address constant WALLET_ADVISORS    = 0x4E147d6C700173EB294e701D088Fb47EC72D05c7;
    address constant WALLET_TEAM        = 0xCE25Cb2dED9062Dd82793b7F7f2Ce8a2c11d4f08;
    address constant WALLET_DEV         = 0x500871fF98A56FE113d343627B910BAA58B9265b;
    address constant WALLET_AIRDROP     = 0xe7A2538C166956E4b9D6efCDBB9D71418fD15B45;
    address constant WALLET_LP_SUPPLY   = 0xC8154413b7d837Ff8bB4e13D9A7C8667423c326B;
    address walletTreasury              = 0x06DA1389306E216dC9Ecf4Ed1a5c65CB278937a1;
    address walletFoundation            = 0x239316cc24973B3AFDEa9Cc2c7Fe86CED685a562;
    address constant PANCAKE_V2_ROUTER_ADDRESS  = 0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3;
    string private constant TOKEN_NAME = "A_07";
    string private constant TOKEN_SYMBOL = "A_07";
    uint8 private constant TOKEN_DECIMALS = 9;
    uint256 private constant T_TOTAL = 210000 * 10**6 * 10**TOKEN_DECIMALS;
    uint256 private constant MAX_BNB_TO_ADD_TO_LP = 2200 * 10**14; //10^-4 scale
    uint256 public constant MAX_TX_AMOUNT = 420 * 10**6 * 10**TOKEN_DECIMALS;
    uint256 private constant NUM_TOKENS_SELL_TO_ADD_TO_LP = 10 * 10**6 * 10**TOKEN_DECIMALS;
    uint256 private constant NUM_TOKENS_SELL_TO_SEND_TO_FOUNDATION = 15 * 10**6 * 10**TOKEN_DECIMALS;
    uint256 private constant MIN_BNB_AMOUNT_TO_SEND_TO_FOUNDATION = 1 * 10**16; //0.01 bnb
    /*   END OF CONFIGURATION   */

    bool private inSwapAndLiquify;
    bool private inSwapForFoundation;


    /******************************************************************
     *          TOKEN
     ******************************************************************/
    uint256 private constant MAX = ~uint256(0);

    uint256 private rTotal = (MAX - (MAX % T_TOTAL));
    uint256 private tFeeTotal;

    // TokenFromReflection rate, valid for the moment of distribution. Used for locked wallets, excluded from rewards
    uint256 private initialTokenFromReflectionRate = rTotal.div(T_TOTAL);

    uint8 public  reflectionFee = 2;
    uint8 private previousReflectionFee = reflectionFee;

    uint8 public  liquidityFee = 2;
    uint8 private previousLiquidityFee = liquidityFee;

    uint8 public  foundationFee = 6;
    uint8 private previousFoundationFee = foundationFee;

    uint256 public numBnbAddedToLiquidity;

    uint256 public foundationCollectedRBalance;

    IUniswapV2Router02 public immutable pancakeV2Router;
    address public pancakeV2Pair;

    /******************************************************************
     *          EVENTS
     ******************************************************************/
    event SwapAndLiquify(uint256 tokensSwapped, uint256 bnbReceived, uint256 tokensIntoLiquidity);
    event BnbBurned (uint256 _amount);
    event SendToFoundation (uint256 _bnbAmount);
    event ReflectionFeeChanged (uint8 _previousFree, uint8 _newFee);
    event LiquidityFeeChanged (uint8 _previousFree, uint8 _newFee);
    event FoundationFeeChanged (uint8 _previousFree, uint8 _newFee);
    event FoundationWalletChanged(address _previousAddr, address _newAddr);
    event TreasuryWalletChanged(address _previousAddr, address _newAddr);

    /******************************************************************
     *          MODIFIERS
     ******************************************************************/
    modifier lockTheSwap {
        inSwapAndLiquify = true;
        _;
        inSwapAndLiquify = false;
    }

    modifier lockTheSwapFoundation {
        inSwapForFoundation = true;
        _;
        inSwapForFoundation = false;
    }

    /******************************************************************
     *          CONSTRUCTOR
     ******************************************************************/
    constructor () {
        assert (NUM_TOKENS_SELL_TO_ADD_TO_LP <= MAX_TX_AMOUNT);
        assert (NUM_TOKENS_SELL_TO_SEND_TO_FOUNDATION <= MAX_TX_AMOUNT);

        // use PancakeRouter V02
        IUniswapV2Router02 _pancakeV2Router = IUniswapV2Router02(PANCAKE_V2_ROUTER_ADDRESS);
        // Create a pancakeSwap pair for this new token.
        // NOTE: _pancakeV2Router.WETH() gives an address of WBNB contract
        pancakeV2Pair = IUniswapV2Factory(_pancakeV2Router.factory())
            .createPair(address(this), _pancakeV2Router.WETH());

        // set the rest of the contract variables
        pancakeV2Router = _pancakeV2Router;

        _initExcludedData();
        _initialDistribution();
    }

    /******************************************************************
     *          STATE FUNCTIONS
     ******************************************************************/
    /**
     * @dev create data records for wallets, excluded from Rewards and from Fee
     *
     * Requirements: N/A
     *
     */
    function _initExcludedData() private {
        // Mark excluded from Fee wallets
        isExcludedFromFee[address(this)]    = true;
        isExcludedFromFee[walletTreasury]   = true;
        isExcludedFromFee[WALLET_AIRDROP]   = true;
        isExcludedFromFee[WALLET_LP_SUPPLY] = true;
        isExcludedFromFee[WALLET_DEV]       = true;
        isExcludedFromFee[WALLET_ADVISORS]  = true;
        isExcludedFromFee[WALLET_TEAM]      = true;

        // Mark excluded from Reward wallets
        // All wallets, which are excluded from reward, shall keep their balances in tAmount.
        excludedFromReward.push(pancakeV2Pair);
        excludedFromReward.push(walletTreasury);
        excludedFromReward.push(WALLET_AIRDROP);
        excludedFromReward.push(WALLET_LP_SUPPLY);
        excludedFromReward.push(WALLET_DEV);
        excludedFromReward.push(WALLET_ADVISORS);
        excludedFromReward.push(WALLET_TEAM);
        isExcludedFromReward[pancakeV2Pair]    = true;
        isExcludedFromReward[walletTreasury]   = true;
        isExcludedFromReward[WALLET_AIRDROP]   = true;
        isExcludedFromReward[WALLET_LP_SUPPLY] = true;
        isExcludedFromReward[WALLET_DEV]       = true;
        isExcludedFromReward[WALLET_ADVISORS]  = true;
        isExcludedFromReward[WALLET_TEAM]      = true;
    }

    /**
     * @dev Initial distribution of minted tokens to accounts:
     *      Airdrop:       50%
     *      LpSupply :     10%
     *      Investors:     15% (6 months initial lock, then linear unlock through 24 months every month)
     *      Team:          10% (6 months initial lock, then linear unlock through 24 months every month)
     *      Advisors:       5% (7 days initial lock, then linear unlock through 24 months every month)
     *      Dev/Marketing: 10% (7 days initial lock, then linear unlock through 24 months every month)
     *
     *      If wallet is excluded from rewards, distribution is done in tAmount. Otherwise in rAmount
     *
     * Requirements: initExcludedData() shall be aready executed before this function call
     */

    /*****************REALWORLD CONFIGURATION *******************************
    function _initialDistribution() private {
        // Initial distribution
        uint256 rAmountToDistribute;
        uint256 _rToDistribute = rTotal;

        // 50% goes to _walletAirdrop
        rAmountToDistribute = rTotal.div(100).mul(50);
        _dropInitialTokens(WALLET_AIRDROP, rAmountToDistribute);
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);

        // 10% goes to LpSupply
        rAmountToDistribute = rTotal.div(100).mul(10);
        _dropInitialTokens(WALLET_LP_SUPPLY, rAmountToDistribute);
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);

        // The rest will be distributed as locked funds
        // Create array of locked wallets
        lockedWallets.push(WALLET_INVESTOR1);
        lockedWallets.push(WALLET_INVESTOR2);
        lockedWallets.push(WALLET_INVESTOR3);
        lockedWallets.push(WALLET_INVESTOR4);
        lockedWallets.push(WALLET_INVESTOR5);
        lockedWallets.push(WALLET_INVESTOR6);
        lockedWallets.push(WALLET_INVESTOR7);
        lockedWallets.push(WALLET_INVESTOR8);
        lockedWallets.push(WALLET_INVESTOR9);
        lockedWallets.push(WALLET_INVESTOR10);
        lockedWallets.push(WALLET_TEAM);
        lockedWallets.push(WALLET_ADVISORS);
        lockedWallets.push(WALLET_DEV);

        assert(lockedWallets.length == 13);

        // 15% goes to 10 Investors (each get 1.5%)
        rAmountToDistribute = rTotal.div(100).mul(15).div(10);
        // all 10 investors have the same unlock setup
        lockedBalanceStruct memory _lockedInvestorBalance = lockedBalanceStruct(
            rAmountToDistribute,                    // lockedBalance
            30 days,                                // nextLockInterval
            block.timestamp.add(6 * 30 days),            // lockedUntill. Initial lock 6 months
            rAmountToDistribute.div(24)                // unlockAmount - linear unlock period 24 months
        );
        lockedBalances[WALLET_INVESTOR1] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR2] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR3] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR4] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR5] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR6] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR7] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR8] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR9] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR10] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);

        // 10% goes to Dev/marketing
        rAmountToDistribute = rTotal.div(100).mul(10);
        lockedBalances[WALLET_DEV] = lockedBalanceStruct(
            rAmountToDistribute ,                   // lockedBalance
            30 days,                                // nextLockInterval
            block.timestamp + 7 days,               // lockedUntill. Initial lock for 7 days
            rAmountToDistribute.div(24)                // unlockAmount - linear unlock period 24 months
        );
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);

        // 5% goes to Advisors
        rAmountToDistribute = rTotal.div(100).mul(5);
        lockedBalances[WALLET_ADVISORS] = lockedBalanceStruct(
            rAmountToDistribute ,                   // lockedBalance
            30 days,                                // nextLockInterval
            block.timestamp,                        // lockedUntill. No initial lock
            rAmountToDistribute.div(24)                // unlockAmount - linear unlock period 24 months
        );
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);

         // 10% goes to Team
        rAmountToDistribute = rTotal.div(100).mul(10);
        lockedBalances[WALLET_TEAM] = lockedBalanceStruct(
            rAmountToDistribute ,                   // lockedBalance
            30 days,                                // nextLockInterval
            block.timestamp.add(6 * 30 days),          // lockedUntill. Initial lock for 6 months
            rAmountToDistribute.div(24)                // unlockAmount - linear unlock period 24 months
        );
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);

        // Token emission shall be completely distributed
        assert (_rToDistribute == 0);
    }
/*

    /********** TEST CONFIGURATION ********************/
    function _initialDistribution() private {
        //Initial distribution
        uint256 rAmountToDistribute;
        uint256 _rToDistribute = rTotal;

        //50% goes to _walletAirdrop
        rAmountToDistribute = rTotal.div(100).mul(50);
        _dropInitialTokens(WALLET_AIRDROP, rAmountToDistribute);   
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);

        //10% goes to LpSupply
        rAmountToDistribute = rTotal.div(100).mul(10);
        _dropInitialTokens(WALLET_LP_SUPPLY, rAmountToDistribute);   
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);

        //The rest will be distributed as locked funds
        //Create array of locked wallets
        lockedWallets.push(WALLET_INVESTOR1);
        lockedWallets.push(WALLET_INVESTOR2);
        lockedWallets.push(WALLET_INVESTOR3);
        lockedWallets.push(WALLET_INVESTOR4);
        lockedWallets.push(WALLET_INVESTOR5);
        lockedWallets.push(WALLET_INVESTOR6);
        lockedWallets.push(WALLET_INVESTOR7);
        lockedWallets.push(WALLET_INVESTOR8);
        lockedWallets.push(WALLET_INVESTOR9);
        lockedWallets.push(WALLET_INVESTOR10);
        lockedWallets.push(WALLET_TEAM);
        lockedWallets.push(WALLET_ADVISORS);
        lockedWallets.push(WALLET_DEV);

        assert(lockedWallets.length == 13);

        //15% goes to 10 Investors (each get 1.5%)
        rAmountToDistribute = rTotal.div(100).mul(15).div(10);
        //all 10 investors have the same unlock setup
        lockedBalanceStruct memory _lockedInvestorBalance = lockedBalanceStruct(
            rAmountToDistribute,          //lockedBalance
            1 hours,                      //nextLockInterval
            block.timestamp + 1 hours,    //lockedUntill. Initial lock 6 months
            rAmountToDistribute.div(24)   //unlockAmount - linear unlock period 24 months
        );
        lockedBalances[WALLET_INVESTOR1] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR2] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR3] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR4] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR5] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR6] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR7] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR8] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR9] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        lockedBalances[WALLET_INVESTOR10] = _lockedInvestorBalance;
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);

        //10% goes to Dev/marketing
        rAmountToDistribute = rTotal.div(100).mul(10);    
        lockedBalances[WALLET_DEV] = lockedBalanceStruct(
            rAmountToDistribute ,           //lockedBalance
            1 hours,                        //nextLockInterval
            block.timestamp.add(1 hours),       //lockedUntill. No initial lock
            rAmountToDistribute.div(24)        //unlockAmount - linear unlock period 24 months           
        );
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);

        //5% goes to Advisors
        rAmountToDistribute = rTotal.div(100).mul(5);    
        lockedBalances[WALLET_ADVISORS] = lockedBalanceStruct(
            rAmountToDistribute ,           //lockedBalance
            1 hours,                        //nextLockInterval
            block.timestamp,                //lockedUntill. No initial lock
            rAmountToDistribute.div(24)        //unlockAmount - linear unlock period 24 months           
        );
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);

         //10% goes to Team
        rAmountToDistribute = rTotal.div(100).mul(10);        
        lockedBalances[WALLET_TEAM] = lockedBalanceStruct(
            rAmountToDistribute ,           //lockedBalance
            1 hours,                        //nextLockInterval
            block.timestamp + 1 hours,  //lockedUntill. No initial lock
            rAmountToDistribute.div(24)        //unlockAmount - linear unlock period 24 months           
        );
        _rToDistribute = _rToDistribute.sub(rAmountToDistribute);
        
        //Token emission shall be completely distributed
        assert (_rToDistribute == 0);
    }

    /**
     * @dev used for distribution of initial tokens.
     *    _initialTokenFromReflectionRate is used to recalculate tAmount from rAmount
     *
     * Requirements: use only for distribution of tokens
     */
    function _dropInitialTokens(address _addr, uint256 _rDropAmount) private {
        uint256 _balanceDiff = balanceOf(_addr);
        rOwned[_addr] = rOwned[_addr].add(_rDropAmount);
        if (isExcludedFromReward[_addr]) {
            tOwned[_addr] = tOwned[_addr].add(_rDropAmount.div(initialTokenFromReflectionRate));
        }
        _balanceDiff = balanceOf(_addr).sub(_balanceDiff);
        emit Transfer(address(0x0), _addr, _balanceDiff);
    }

    /**
     * @dev checks unlock conditions and does unlock, if needed.
     *    - for wallets, excluded from rewards, unlock put balance
     *      to _rOwned and _tOwned(upplying initialTokenFromReflectionRate rate) balances
     *    - for other wallets, balance is unlocked just to rOwned balance
     *
     * Requirements: N/A
     */
    function checkFundsUnlock(address _addr) public {
        if (lockedBalances[_addr].rLockedBalance > 0) {
            if (block.timestamp >= lockedBalances[_addr].lockedUntill) {

                uint256 rDropAmount = lockedBalances[_addr].rUnlockAmount;
                if (rDropAmount > lockedBalances[_addr].rLockedBalance) {
                    rDropAmount = lockedBalances[_addr].rLockedBalance;
                }
                _dropInitialTokens(_addr, rDropAmount);
                lockedBalances[_addr].rLockedBalance = (lockedBalances[_addr].rLockedBalance).sub(rDropAmount);
                // set next unlock time
                if (lockedBalances[_addr].rLockedBalance > 0) {
                    lockedBalances[_addr].lockedUntill = (lockedBalances[_addr].lockedUntill).add(lockedBalances[_addr].nextLockInterval);
                }
                else
                    lockedBalances[_addr].lockedUntill = 0;
            }
        }
    }

    /**
     * @dev check and do unlock of funds for all locked wallets
     *
     * Requirements: N/A
     */
    function checkFundsUnlockAll() public {
        for (uint256 i = 0; i < lockedWallets.length; i++) {
            checkFundsUnlock(lockedWallets[i]);
        }
    }

    function transfer(address _recipient, uint256 _amount) public override returns (bool) {
        _transfer(_msgSender(), _recipient, _amount);
        return true;
    }

    function allowance(address _owner, address _spender) public view override returns (uint256) {
        return allowances[_owner][_spender];
    }

    function approve(address _spender, uint256 _amount) public override returns (bool) {
        _approve(_msgSender(), _spender, _amount);
        return true;
    }

    function transferFrom(address _sender, address _recipient, uint256 _amount) public override returns (bool) {
        _transfer(_sender, _recipient, _amount);
        _approve(_sender, _msgSender(), allowances[_sender][_msgSender()].sub(_amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function increaseAllowance(address _spender, uint256 _addedValue) public virtual returns (bool) {
        _approve(_msgSender(), _spender, allowances[_msgSender()][_spender].add(_addedValue));
        return true;
    }

    function decreaseAllowance(address _spender, uint256 _subtractedValue) public virtual returns (bool) {
        _approve(_msgSender(), _spender, allowances[_msgSender()][_spender].sub(_subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _takeLiquidity(uint256 _tLiquidity, uint256 _rLiquidity) private {
        rOwned[address(this)] = rOwned[address(this)].add(_rLiquidity);
        if (isExcludedFromReward[address(this)]) {
            tOwned[address(this)] = tOwned[address(this)].add(_tLiquidity);
        }
    }

    function _takeFoundation(uint256 _tFoundation, uint256 _rFoundation) private {
        rOwned[address(this)] = rOwned[address(this)].add(_rFoundation);
        if (isExcludedFromReward[address(this)]) { // Shall not be excluded
            tOwned[address(this)] = tOwned[address(this)].add(_tFoundation);
        }
        foundationCollectedRBalance = foundationCollectedRBalance.add(_rFoundation);
    }

    function _removeAllFee() private {
        if (reflectionFee == 0 && liquidityFee == 0 && foundationFee == 0) {
            return;
        }

        previousReflectionFee = reflectionFee;
        previousLiquidityFee  = liquidityFee;
        previousFoundationFee = foundationFee;

        reflectionFee = 0;
        liquidityFee = 0;
        foundationFee = 0;
    }

    function _restoreAllFee() private {
        reflectionFee = previousReflectionFee;
        liquidityFee  = previousLiquidityFee;
        foundationFee = previousFoundationFee;
    }

    function _approve(address _owner, address _spender, uint256 _amount) private {
        require(_owner != address(0), "ERC20: approve from the zero address");
        require(_spender != address(0), "ERC20: approve to the zero address");

        allowances[_owner][_spender] = _amount;
        emit Approval(_owner, _spender, _amount);
    }

    /**
     * @dev manage balance collected for foundation.
     *
     * Requirements: NUM_TOKENS_SELL_TO_SEND_TO_FOUNDATION <= MAX_TX_AMOUNT
     */
    function _foundation(address _from) private {
        if (
            !inSwapForFoundation &&
            _from != pancakeV2Pair
        ) {
            uint256 contractBalance = balanceOf(address(this));
            uint256 foundationCollectedTokenBalance = tokenFromReflection(foundationCollectedRBalance);
            if (foundationCollectedTokenBalance < contractBalance) {
                contractBalance = foundationCollectedTokenBalance;
            }

            bool overMinTokenBalance = contractBalance >= NUM_TOKENS_SELL_TO_SEND_TO_FOUNDATION;
            if (overMinTokenBalance) {
                foundationCollectedRBalance = foundationCollectedRBalance.sub(reflectionFromToken(NUM_TOKENS_SELL_TO_SEND_TO_FOUNDATION, false));
                _swapTokensForBnb(NUM_TOKENS_SELL_TO_SEND_TO_FOUNDATION);
            }
        }

        if (!inSwapForFoundation)
            _sendCollectedBnbToFoundation();
    }

    /*
     * @dev send all BNB, collected till now from 6% foundation fee to foundation wallet
     */
    function _sendCollectedBnbToFoundation() private {
        if (address(this).balance > MIN_BNB_AMOUNT_TO_SEND_TO_FOUNDATION) {
            emit SendToFoundation(address(this).balance);
            (bool success, ) = payable(walletFoundation).call{value:(address(this).balance)}("");
            require(success, "Transfer failed.");
        }
    }

    /**
     * @dev manage liquify balance of the token contract.
     *      collected from fee tokens on the balance of the contract are:
     *        - if numTokensSellToAddToLiquidity is available on balance:
     *              - in case total tokens amount  added to liquidityPool from fees does not exceed maxTokensToLuquify:
     *                  - swap half to BNB and add to liquiditypool
     *              - in case total tokens amount  added to liquidityPool from fees exceeds maxTokensToLuquify:
     *                  - send tokens to walletTreasury
     *
     * Requirements: NUM_TOKENS_SELL_TO_ADD_TO_LP <= MAX_TX_AMOUNT
     */
    function _liquify(address _from) private returns(bool) {
        if (
            !inSwapAndLiquify &&
            _from != pancakeV2Pair   // token buyer is not paying extra gas for this extra operation
        ) {
            uint256 contractTokenBalanceToUse = balanceOf(address(this));
            uint256 foundationCollectedTokenBalance = tokenFromReflection(foundationCollectedRBalance);
            
            if (foundationCollectedTokenBalance <= contractTokenBalanceToUse) {
                contractTokenBalanceToUse = contractTokenBalanceToUse.sub(foundationCollectedTokenBalance);
            }
            
            bool overMinTokenBalance = contractTokenBalanceToUse >= NUM_TOKENS_SELL_TO_ADD_TO_LP;
            if (overMinTokenBalance) {
                contractTokenBalanceToUse = NUM_TOKENS_SELL_TO_ADD_TO_LP;
                if (numBnbAddedToLiquidity < MAX_BNB_TO_ADD_TO_LP) {
                    // add liquidity
                    _swapAndLiquify(contractTokenBalanceToUse);
                }
                else {
                    // transfer collected tokens to walletTreasury without fee.
                    _tokenTransfer(address(this), walletTreasury, contractTokenBalanceToUse,false);
                }
                return (true);
            }
        }
        return (false);
    }

    function _transfer(
        address _from,
        address _to,
        uint256 _amount
    ) private {
        require(_from != address(0), "ERC20: transfer from the zero address");
        require(_to != address(0), "ERC20: transfer to the zero address");
        require(_amount > 0, "Transfer amount must be greater than zero");
        /* exclude from maxTxAmount limitation following transactions:
         *    - from WALLET_AIRDROP (initial distribution of tokens)
         *    - from WALLET_LP_SUPPLY (initial creation of LP)
         *    - taking out liquidity:
         *        - from PancakePair to PancakeRouter(first step of taking liquidity in BNB)
         *        - from PancakeRouter(second step of taking liquidity in BNB)
         */
        if ((_from != WALLET_AIRDROP) &&
            (_from != WALLET_LP_SUPPLY) &&
            !((_from == pancakeV2Pair) && (_to == PANCAKE_V2_ROUTER_ADDRESS)) &&
            (_from != PANCAKE_V2_ROUTER_ADDRESS))
        {
            require(_amount <= MAX_TX_AMOUNT, "Transfer amount exceeds the maxTxAmount.");
        }

        // add collected tokens to liquidity pool.
        bool liquify_executed;
        // skip liquify() and foundation() if Tx is for taking liquidity
        if (!((_from == pancakeV2Pair) && (_to == PANCAKE_V2_ROUTER_ADDRESS)) ||
            (_from == PANCAKE_V2_ROUTER_ADDRESS))
        {
            if (!inSwapForFoundation)
                liquify_executed = _liquify(_from);
            // convert collected tokens to BNB and transfer to Foundation.
            if (!liquify_executed && !inSwapAndLiquify)
                _foundation(_from);
        }

        // indicates if fee should be deducted from transfer
        bool _takeFee = true;
        // if any account belongs to _isExcludedFromFee account then do not take the fee
        // Also do not take fee when liquidity is taken out
        if (isExcludedFromFee[_from]
            || isExcludedFromFee[_to] ||
            (_from == pancakeV2Pair && _to == PANCAKE_V2_ROUTER_ADDRESS) ||
            _from == PANCAKE_V2_ROUTER_ADDRESS)
        {
            _takeFee = false;
        }

        // transfer amount, it will take tax, burn, liquidity fee
        _tokenTransfer(_from,_to, _amount,_takeFee);
    }

    function _swapAndLiquify(uint256 _amount) private lockTheSwap {
        // split the contract balance into halves
        uint256 half = _amount.div(2);
        uint256 otherHalf = _amount.sub(half);

        // capture the contract's current BNB balance.
        // this is so that we can capture exactly the amount of BNB that the
        // swap creates, and not make the liquidity event include any BNB that
        // has been manually sent to the contract
        uint256 initialBalance = address(this).balance;

        // swap tokens for BNB
        _swapTokensForBnb(half); // <- this breaks the BNB -> HATE swap when swap+liquify is triggered

        // how much BNB did we just swap into?
        uint256 newBalance = address(this).balance.sub(initialBalance);

        // take in account also part, added in tokens
        numBnbAddedToLiquidity = numBnbAddedToLiquidity.add(newBalance.mul(2));

        // add liquidity to pancakeswap
        _addLiquidity(otherHalf, newBalance);

        emit SwapAndLiquify(half, newBalance, otherHalf);
    }

    function _swapTokensForBnb(uint256 _tokenAmount) private lockTheSwapFoundation {
        // generate the pancakeswap pair path of token -> wbnb
        address[] memory _path = new address[](2);
        _path[0] = address(this);
        _path[1] = pancakeV2Router.WETH();

        _approve(address(this), address(pancakeV2Router), _tokenAmount);

        // make the swap
        pancakeV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            _tokenAmount,
            0, // accept any amount of BNB
            _path,
            address(this),
            block.timestamp
        );
    }

    function _swapBnbForTokens(uint256 _bnbAmount) private {
        // generate the pancakeswap pair path of token -> wbnb
        address[] memory _path = new address[](2);
        _path[0] = pancakeV2Router.WETH();
        _path[1] = address(this);

        _approve(address(this), address(pancakeV2Router), _bnbAmount);

        // make the swap
        pancakeV2Router.swapExactETHForTokensSupportingFeeOnTransferTokens{value: _bnbAmount}(
            0, // accept any amount of Tokens
            _path,
            address(this), // Burn tokens on contracts address
            block.timestamp.add(300)
        );
    }

    function _addLiquidity(uint256 _tokenAmount, uint256 _bnbAmount) private {
        // approve token transfer to cover all possible scenarios
        _approve(address(this), address(pancakeV2Router), _tokenAmount);

        // add the liquidity
        pancakeV2Router.addLiquidityETH{value: _bnbAmount}(
            address(this),
            _tokenAmount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            BURN_ADDRESS,
            block.timestamp
        );
    }

    /**
     * This method is responsible for taking all fee, if takeFee is true
     */
    function _tokenTransfer(address _sender, address _recipient, uint256 _amount,bool _takeFee) private {
        if (!_takeFee)
            _removeAllFee();

        if (isExcludedFromReward[_sender] && !isExcludedFromReward[_recipient]) {
            _transferFromExcludedFromReward(_sender, _recipient, _amount);
        } else if (!isExcludedFromReward[_sender] && isExcludedFromReward[_recipient]) {
            _transferToExcludedFromReward(_sender, _recipient, _amount);
        } else if (isExcludedFromReward[_sender] && isExcludedFromReward[_recipient]) {
            _transferBothExcludedFromReward(_sender, _recipient, _amount);
        } else {
            _transferStandard(_sender, _recipient, _amount);
        }

        if (!_takeFee)
            _restoreAllFee();
    }

    function _transferStandard(address _sender, address _recipient, uint256 _tAmount) private {
        tValuesStruct memory _tValues;
        rValuesStruct memory _rValues;
        (_rValues, _tValues) = _getValues(_tAmount);
        rOwned[_sender] = rOwned[_sender].sub(_rValues.rAmount);
        rOwned[_recipient] = rOwned[_recipient].add(_rValues.rTransferAmount);
        _takeLiquidity(_tValues.tLiquidity, _rValues.rLiquidity);
        _takeFoundation(_tValues.tFoundation, _rValues.rFoundation);
        _reflectFee(_rValues.rReflection, _tValues.tReflection);
        emit Transfer(_sender, _recipient, _tValues.tTransferAmount);
    }

    function _transferToExcludedFromReward(address _sender, address _recipient, uint256 _tAmount) private {
        tValuesStruct memory _tValues;
        rValuesStruct memory _rValues;
        (_rValues, _tValues) = _getValues(_tAmount);
        rOwned[_sender] = rOwned[_sender].sub(_rValues.rAmount);
        tOwned[_recipient] = tOwned[_recipient].add(_tValues.tTransferAmount);
        rOwned[_recipient] = rOwned[_recipient].add(_rValues.rTransferAmount);
        _takeLiquidity(_tValues.tLiquidity, _rValues.rLiquidity);
        _takeFoundation(_tValues.tFoundation, _rValues.rFoundation);
        _reflectFee(_rValues.rReflection, _tValues.tReflection);
        emit Transfer(_sender, _recipient, _tValues.tTransferAmount);
    }

    function _transferFromExcludedFromReward(address _sender, address _recipient, uint256 _tAmount) private {
        tValuesStruct memory _tValues;
        rValuesStruct memory _rValues;
        (_rValues, _tValues) = _getValues(_tAmount);
        tOwned[_sender] = tOwned[_sender].sub(_tValues.tAmount);
        rOwned[_sender] = rOwned[_sender].sub(_rValues.rAmount);
        rOwned[_recipient] = rOwned[_recipient].add(_rValues.rTransferAmount);
        _takeLiquidity(_tValues.tLiquidity, _rValues.rLiquidity);
        _takeFoundation(_tValues.tFoundation, _rValues.rFoundation);
        _reflectFee(_rValues.rReflection, _tValues.tReflection);
        emit Transfer(_sender, _recipient, _tValues.tTransferAmount);
    }

    function _transferBothExcludedFromReward(address _sender, address _recipient, uint256 _tAmount) private {
        tValuesStruct memory _tValues;
        rValuesStruct memory _rValues;
        (_rValues, _tValues) = _getValues(_tAmount);
        tOwned[_sender] = tOwned[_sender].sub(_tValues.tAmount);
        rOwned[_sender] = rOwned[_sender].sub(_rValues.rAmount);
        tOwned[_recipient] = tOwned[_recipient].add(_tValues.tTransferAmount);
        rOwned[_recipient] = rOwned[_recipient].add(_rValues.rTransferAmount);
        _takeLiquidity(_tValues.tLiquidity, _rValues.rLiquidity);
        _takeFoundation(_tValues.tFoundation, _rValues.rFoundation);
        _reflectFee(_rValues.rReflection, _tValues.tReflection);
        emit Transfer(_sender, _recipient, _tValues.tTransferAmount);
    }

    function setReflectionFee(uint8 _value) external onlyOwner {
        checkFeeInRange(_value, 1, 4);
        uint8 prevFee = reflectionFee;
        reflectionFee = _value;
        checkTotalFeeInRange();
        emit ReflectionFeeChanged(prevFee, reflectionFee);
    }

    function setLiquidityFee(uint8 _value) external onlyOwner {
        checkFeeInRange(_value, 1, 4);
        uint8 prevFee = liquidityFee;
        liquidityFee = _value;
        checkTotalFeeInRange();
        emit LiquidityFeeChanged(prevFee, liquidityFee);
    }

    function setFoundationFee(uint8 _value) external onlyOwner {
        checkFeeInRange(_value, 1, 8);
        uint8 prevFee = foundationFee;
        foundationFee = _value;
        checkTotalFeeInRange();
        emit FoundationFeeChanged(prevFee, foundationFee);
    }
    
    
    function setFoundationWallet(address _addr) external onlyOwner {
        emit FoundationWalletChanged(walletFoundation, _addr);
        walletFoundation = _addr;
    }

    function setTreasuryWallet(address _addr) external onlyOwner {
        emit TreasuryWalletChanged(walletTreasury, _addr);
        walletTreasury = _addr;
    }

    /******************************************************************
     *          VIEW FUNCTIONS
     ******************************************************************/
    function getOwner() public view override returns (address) {
        return owner();
    }

     /**
     * @dev returns time till next balance unlock for a wallet.
     * returns 0 if wallet is not locked or lock time expired
     *
     * Requirements: N/A
     */
    function getTimeTillNextUnlock(address _addr) public view returns(uint256) {
        if (lockedBalances[_addr].rLockedBalance > 0 &&
            lockedBalances[_addr].lockedUntill > block.timestamp) {
            return ((lockedBalances[_addr].lockedUntill).sub(block.timestamp));
        }
        // Wallet was not in the list of lockedWallets
        return 0;
    }

    /**
     * @dev the balance of wallet
     *
     * Requirements: N/A
     */
    function balanceOf(address _account) public view override returns (uint256) {
        if (isExcludedFromReward[_account]) return tOwned[_account];
        return tokenFromReflection(rOwned[_account]);
    }

    function getExcludedFromReward(address _account) public view returns (bool) {
        return isExcludedFromReward[_account];
    }

    function totalFees() public view returns (uint256) {
        return tFeeTotal;
    }

    function reflectionFromToken(uint256 _tAmount, bool _deductTransferFee) public view returns(uint256) {
        require(_tAmount <= T_TOTAL, "Amount must be less than supply");

        tValuesStruct memory _tValues;
        rValuesStruct memory _rValues;
        (_rValues, _tValues) = _getValues(_tAmount);

        if (!_deductTransferFee) {
            return _rValues.rAmount;
        } else {
            return _rValues.rTransferAmount;
        }
    }

    function tokenFromReflection(uint256 _rAmount) public view returns(uint256) {
        require(_rAmount <= rTotal, "Amount must be less than total reflections");

        uint256 currentRate =  _getRate();

        return _rAmount.div(currentRate);
    }

    function _reflectFee(uint256 _rFee, uint256 _tFee) private {
        rTotal = rTotal.sub(_rFee);
        tFeeTotal = tFeeTotal.add(_tFee);
    }

    function _getValues(uint256 _tAmount) private view returns (rValuesStruct memory, tValuesStruct memory) {
        tValuesStruct memory _tValues = _getTValues(_tAmount);
        //(uint256 rAmount, uint256 rTransferAmount, uint256 rReflection, uint256 rLiquidity, uint256 rFoundation) = _getRValues(tAmount, tReflection, tLiquidity, tFoundation, _getRate());
        rValuesStruct memory _rValues = _getRValues(_tValues, _getRate());

        return (_rValues, _tValues);
    }

    function _getTValues(uint256 _tAmount) private view returns (tValuesStruct memory) {
        tValuesStruct memory _tValues;

        _tValues.tAmount = _tAmount;
        _tValues.tReflection = _tAmount.mul(reflectionFee).div(10**2);
        _tValues.tLiquidity = _tAmount.mul(liquidityFee).div(10**2);
        _tValues.tFoundation = _tAmount.mul(foundationFee).div(10**2);
        _tValues.tTransferAmount = _tAmount.sub(_tValues.tReflection).sub(_tValues.tLiquidity).sub(_tValues.tFoundation);

        return (_tValues);
    }

    function _getRValues(tValuesStruct memory _tValues, uint256 _currentRate) private pure returns (rValuesStruct memory) {
        rValuesStruct memory _rValues;

        _rValues.rAmount = _tValues.tAmount.mul(_currentRate);
        _rValues.rReflection = _tValues.tReflection.mul(_currentRate);
        _rValues.rLiquidity = _tValues.tLiquidity.mul(_currentRate);
        _rValues.rFoundation = _tValues.tFoundation.mul(_currentRate);
        _rValues.rTransferAmount = _rValues.rAmount.sub(_rValues.rReflection).sub(_rValues.rLiquidity).sub(_rValues.rFoundation);

        return (_rValues);
    }

    function _getRate() private view returns(uint256) {
        (uint256 _rSupply, uint256 _tSupply) = _getCurrentSupply();

        return _rSupply.div(_tSupply);
    }

    function _getCurrentSupply() private view returns(uint256, uint256) {
        uint256 _rSupply = rTotal;
        uint256 _tSupply = T_TOTAL;

        for (uint256 i = 0; i < excludedFromReward.length; i++) {
            if (rOwned[excludedFromReward[i]] > _rSupply || tOwned[excludedFromReward[i]] > _tSupply) return (rTotal, T_TOTAL);
            _rSupply = _rSupply.sub(rOwned[excludedFromReward[i]]);
            _tSupply = _tSupply.sub(tOwned[excludedFromReward[i]]);
        }

        if (_rSupply < rTotal.div(T_TOTAL)) return (rTotal, T_TOTAL);
        return (_rSupply, _tSupply);
    }

    function getExcludedFromFee(address _account) public view returns(bool) {
        return isExcludedFromFee[_account];
    }

    function name() public pure override returns (string memory) {
        return TOKEN_NAME;
    }

    function symbol() public pure override returns (string memory) {
        return TOKEN_SYMBOL;
    }

    function decimals() public pure override returns (uint8) {
        return TOKEN_DECIMALS;
    }

    function totalSupply() public pure override returns (uint256) {
        return T_TOTAL;
    }
    
    function tokensCollectedForFoundation() public view returns (uint256) {
        return (tokenFromReflection(foundationCollectedRBalance));
    }

    function tokensCollectedForLpAndFoundation() public view returns (uint256) {
        return (balanceOf(address(this)));
    }

    /**
     * @dev get locked balance of a wallet
     *     in case wallet is excluded from reflection rewards, 
     *     rAmount is recalculated to tAmount
     *     using _initialTokenFromReflectionRate
     *
     */
    function getLockedBalance(address _addr) public view returns(uint256 _lockedBalance) {
        _lockedBalance = lockedBalances[_addr].rLockedBalance;
        if (isExcludedFromReward[_addr]) 
            _lockedBalance = _lockedBalance.div(initialTokenFromReflectionRate);
        return _lockedBalance;
    }
        
    function circulatingSupply() public view returns (uint256 _circulatingSupply) {
        _circulatingSupply = totalSupply();

        _circulatingSupply = _circulatingSupply.sub(balanceOf(BURN_ADDRESS));
        for (uint256 idx = 0; idx < lockedWallets.length; idx++)
            _circulatingSupply = _circulatingSupply.sub(getLockedBalance(lockedWallets[idx]));
        return _circulatingSupply;
    }

    function checkTotalFeeInRange() internal view {
        require((foundationFee + liquidityFee + reflectionFee <= 10) && (foundationFee + liquidityFee + reflectionFee >= 3), "Total fee exceeds 10%");
    }

    function checkFeeInRange(uint8 _fee, uint8 _min, uint8 _max) internal pure {
        require((_fee >= _min) && (_fee <= _max), "Fee out of bounds");
    }

    /**
     * To recieve BNB from pancakeV2Router when swaping
     */
    receive() external payable {}
}

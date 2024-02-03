## Real Life Examples of FlashLoan Attacks

### 1. Euler Finance: $197m (March 2023)

In March 2023, Euler Finance suffered a major hack amounting to $197 million, making it one of the largest in recent history. Here's what happened and how it unfolded:

#### Vulnerability Explanation:

 - Euler Finance enables users to borrow and lend using eTokens (collateral) and dTokens (debt).
 - The hacker exploited a flaw in Euler's eToken function, causing incorrect asset conversion of borrowed assets to collateralized assets.
 - They used a front-running bot and personal wallet, with initial funding from Tornado Cash, a mixer.

#### Attack Explanation:

 - The hacker took a $30 million flash loan in DAI from Defi Protocol Aave, depositing $20 million into Euler and getting eDAI tokens.
 - Leveraging Euler's borrowing, they borrowed 10 times the deposit amount.
 - Using $10 million to repay debt, they kept borrowing until loan closure.

### Aftermath:

 - Euler lost $197 million across DAI, wBTC, stETH, and USDC.
 - EUL token value dropped by over 45%.
 - Remarkably, the hacker returned the funds later.

#### Lessons Learned:

- Euler Finance improved its security and auditing processes.
- The incident highlighted the importance of flash loan security and the need for better risk management.

### 2. Cream Finance: $37.5m (February 2021)

In October 2021, CREAM Finance faced a $130 million hack, showcasing another significant DeFi breach:

#### Vulnerability Explanation:

 - The attack centered on CREAM’s yUSDVault, aiming to double crYUSD token value. 
 - The attacker’s goal was to mint a significant number of crYUSD tokens and exploit a flaw in the vault to double the perceived value of these shares.

#### Attack Explanation:

- Two accounts took flash loans from MakerDAO and AAVE, depositing DAI into Curve’s yPool to create yDAI which was used to mint yUSD.
- Borrowed ETH served as collateral to borrow additional yUSD, with one address transferring $500 million in yUSDVault tokens to the other.
- They repeated this, accumulating $1.5 billion in crYUSD and $500 million in yUSDVault.

### Aftermath:

 - The first attacker address possessed $1.5 billion in crYUSD, which the vault now valued at $3 billion. 
 - The attacker used $2 billion and the previously withdrawn $500 million to repay their flash loans.
 - The remaining $1 billion in crYUSD allowed the attacker to drain CREAM’s $130 million in available assets.

### Conclusion:

- These incidents underscore the vulnerabilities within DeFi platforms and the need for robust security measures.

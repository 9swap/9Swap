# 9Swap
Atomic cross-chain swaps for N-Chain, Chia, and other Chia forks.

## Why use 9Swap?

**It's faster**: There's no need to search for an escrow! A 9Swap trade has 100 blocks (31.25 minutes) to succeed. If anything goes wrong, you'll get your money back in 150 blocks (~47 minutes) from the original transaction.

**It's cheaper**: The total swap fee doesn't exceed 0.5% of the transacted amount.

**It's safer**: It's always safer to trust nobody rather than somebody. With 9Swap, you don't need to trust anyone - escrows, intermediaries, exchanges or trade partners - since your money is handled by smart contracts.

## How to use
You're going to need a fully synced node for each currency involved in a swap except NCH, Chia, and XFX. Download the latest version of 9Swap from the [releases page of this project](https://github.com/9swap/9Swap/releaseshttps://github.com/Yakuhito/9Swap/releases
After conecting with a trade partner via the Discord bot, copy the given string to your clipboard. Open 9Swap, navigate to the 'Trades' tab, and click on the 'Add new trade' button. Click on 'Import' to load the trade from your clipboard. After clicking 'save', click on the trade to start it (the newest trade is usually at the bottom of the list).

You can now follow the intructions on screen. You and your partner will make one transaction each for fork trades. After seeing 'Done! Check your wallet :)' or 'Done' and  using the wallet to confirm that you have successfully received your coins (you might have to wait a minute for the transaction to be included in a block), you can safely delete the trade.

Please note that the server creates a new log file for each trade. If anything unexpected happens with one of your trades, its log file will be useful in restoring your coins. However, the log also contains sensitive data, so please only share it with trusted people.

## FAQ
### What is an atomic cross-chain swap?
It's a way of exchanging two cryptocurrencies without a trusted third party.

### Why is the binary detected as a trojan/virus?
I have a few theories, but I cannot give a definitive answer. All binaries were built using GitHub Actions from the public source code, which you can find in my repositories - if you don't want to trust me, just read the code and compile the binaries yourself.

### My trade partner took a really long time (> 30 min) to complete a step. Is there any danger?
If the total time required to make a trade is higher than 30-40 minutes, I highly recommend cancelling it by closing the client and the server, waiting one hour and then opening the trade - that doesn't mean your partner had malicious intentions, though. Please keep in mind that your coins will get unlocked one hour after they were initially locked.

### I just cancelled my trade / My trade just got cancelled. How long do I have to wait before getting my coins back?
If your trade gets cancelled for any reason, your coins will be locked for a certain period of time. For most currencies, that period is 192 blocks from the moment the contract was issued (about 1 hour). This long period was chosen in order to prevent a certain kind of attack against the swap.

### Can my Chia fork be added?
You can PM/DM me about it, but my response time tends to be very high. I strongly recommend using the app's Import/Export functionality to distribute your currency - that way, users can add your coin with a few clicks!


### Why do I have to pay a 0.5% fee on all trades?
You don't have to - you can always modify the source of the exchange contract and remove the fee. However, the 0.5% fee motivates me to continue supporting this project (which was developed in my free time), so I'd really appreciate if you don't.

### License?
Apache 2.0 (see end of README.md & LICENSE)

### Credit
Originally designed and developed by Yakuhito(yakuSwap).

License
=======
    Copyright 2021 Mihai Dancaescu

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
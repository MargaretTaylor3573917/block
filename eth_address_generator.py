from web3 import Web3

def generate_eth_wallet():
    w3 = Web3()
    account = w3.eth.account.create()
    return {
        "address": account.address,
        "private_key": account._private_key.hex()
    }

if __name__ == "__main__":
    wallet = generate_eth_wallet()
    print("Address:", wallet["address"])
    print("Private Key:", wallet["private_key"])

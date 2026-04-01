const crypto = require('crypto');

class Block {
  constructor(index, prevHash, data) {
    this.index = index;
    this.prevHash = prevHash;
    this.timestamp = Date.now();
    this.data = data;
    this.nonce = 0;
    this.hash = this.calcHash();
  }

  calcHash() {
    const str = this.index + this.prevHash + this.timestamp + this.data + this.nonce;
    return crypto.createHash('sha256').update(str).digest('hex');
  }

  mine(difficulty) {
    while (!this.hash.startsWith('0'.repeat(difficulty))) {
      this.nonce++;
      this.hash = this.calcHash();
    }
  }
}

module.exports = Block;

import hashlib
import time

def generate_hash(data: str) -> str:
    sha256 = hashlib.sha256()
    sha256.update(data.encode('utf-8'))
    return sha256.hexdigest()

def create_timestamp_record(content: str) -> dict:
    ts = int(time.time())
    data = f"{ts}_{content}"
    record_hash = generate_hash(data)
    return {
        "timestamp": ts,
        "content": content,
        "hash": record_hash
    }

if __name__ == "__main__":
    record = create_timestamp_record("My first on-chain proof")
    print(record)

import os
import json

DEFAULT_CONFIG_PATH = os.path.join(os.path.dirname(__file__), "config.json")
DEFAULT_SOCKET_PATH = "/tmp/sysmon.sock"

def load_config():
    # 1. Check env var override first
    env_socket_path = os.environ.get("SYSMON_SOCKET_PATH")
    if env_socket_path:
        return {"socket_path": env_socket_path}

    # 2. Try loading from config.json
    try:
        with open(DEFAULT_CONFIG_PATH, "r") as f:
            config = json.load(f)
            return config
    except (FileNotFoundError, json.JSONDecodeError):
        pass

    # 3. Fallback to default
    return {"socket_path": DEFAULT_SOCKET_PATH}


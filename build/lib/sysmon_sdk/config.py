import json
import os

DEFAULT_CONFIG_PATH = os.path.join(os.path.dirname(__file__), "config.json")
print(f"DEFAULT_CONFIG_PATH is {DEFAULT_CONFIG_PATH}")

def load_config(path: str = None):
    config_path = path or DEFAULT_CONFIG_PATH
    print(f"config_path is {config_path}")
    try:
        with open(config_path) as f:
            return json.load(f)
    except Exception as e:
        raise RuntimeError(f"Failed to load config: {e}")

import socket
from .config import load_config

_config = load_config()
SOCKET_PATH = _config.get("socket_path", "/tmp/sysmon.sock")


def send_command(message: str) -> str:
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as client:
        client.connect(SOCKET_PATH)
        client.sendall(message.encode())
        return client.recv(1024).decode()

def get_metrics():
    return send_command("metrics")

def get_status():
    return send_command("status")

def shutdown_daemon():
    return send_command("shutdown")


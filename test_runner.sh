#!/bin/bash
set -e

echo "[*] Cleaning old coverage..."
coverage erase

echo "[*] Starting daemon with coverage..."
coverage run --parallel-mode sysmon_sdk/daemon.py &
DAEMON_PID=$!
sleep 2  # give it time to bind the socket

echo "[*] Running tests with coverage..."
coverage run --parallel-mode -m pytest

echo "[*] Shutting down daemon..."
python -c 'from sysmon_sdk.core import shutdown_daemon; shutdown_daemon()'

sleep 1  # wait for daemon to cleanly exit

echo "[*] Combining coverage data..."
coverage combine

echo "[*] Generating HTML report..."
coverage html

open htmlcov/index.html


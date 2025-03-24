import argparse
from sysmon_sdk import get_metrics, get_status, shutdown_daemon

def main():
    parser = argparse.ArgumentParser(description="SysMon CLI")
    parser.add_argument("command", choices=["status", "metrics", "shutdown"])
    args = parser.parse_args()

    if args.command == "status":
        print(get_status())
    elif args.command == "metrics":
        print(get_metrics())
    elif args.command == "shutdown":
        print(shutdown_daemon())

# Optional: allow running directly
if __name__ == "__main__":
    main()


import subprocess

def run_cli(command):
    result = subprocess.run(
        ["sysmon", command],
        capture_output=True,
        text=True
    )
    return result.stdout.strip()

def test_status():
    output = run_cli("status")
    assert "Processed" in output

def test_metrics():
    output = run_cli("metrics")
    assert "Processed" in output


import subprocess
import sys
import os

def get_os_info():
    with open("/etc/os-release") as f:
        for line in f:
            if line.startswith("PRETTY_NAME="):
                os_name = line.split("=", 1)[1].strip().strip('"')
                if os_name != "Debian GNU/Linux 13 (trixie)":
                    print("This script is only designed for Debian 13")
                    sys.exit()

def collect_packages_from_dir(directory):
    packages = []
    for filename in os.listdir(directory):
        if filename.endswith(".txt"):
            path = os.path.join(directory, filename)
            with open(path) as f:
                for line in f:
                    stripped = line.strip()
                    if stripped and not stripped.startswith("#"):
                        packages.append(stripped)
    return packages

def main():
    dependencies_dir = "Dependencies"
    packages = collect_packages_from_dir(dependencies_dir)
    subprocess.run(["sudo", "apt", "install", *packages])

main()


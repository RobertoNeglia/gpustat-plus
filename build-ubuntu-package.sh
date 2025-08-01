#!/bin/bash

# Ubuntu Package Build Script for gpustat-plus
# This script builds a Debian/Ubuntu package from the gpustat-plus source

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR"

echo "Building Ubuntu package for gpustat-plus..."

# Check if we're in the right directory
if [ ! -f "$PROJECT_DIR/setup.py" ] || [ ! -d "$PROJECT_DIR/debian" ]; then
    echo "Error: This script must be run from the gpustat-plus project root directory"
    echo "Expected files: setup.py, debian/ directory"
    exit 1
fi

# Check for required tools
echo "Checking for required build tools..."
required_tools=("dpkg-buildpackage" "debhelper" "dh-python")
missing_tools=()

for tool in "${required_tools[@]}"; do
    if ! command -v "$tool" &> /dev/null && ! dpkg -l | grep -q "$tool"; then
        missing_tools+=("$tool")
    fi
done

if [ ${#missing_tools[@]} -ne 0 ]; then
    echo "Missing required tools: ${missing_tools[*]}"
    echo "Please install them with:"
    echo "sudo apt update && sudo apt install -y build-essential debhelper dh-python python3-all python3-setuptools python3-setuptools-scm python3-wheel devscripts"
    exit 1
fi

# Clean previous builds
echo "Cleaning previous build artifacts..."
rm -rf build/ dist/ *.egg-info/ .pybuild/
rm -f ../*.deb ../*.buildinfo ../*.changes

# Build the package
echo "Building the package..."
cd "$PROJECT_DIR"
dpkg-buildpackage -us -uc -b

echo ""
echo "✅ Build completed successfully!"
echo ""
echo "Generated package files:"
ls -la ../*.deb ../*.buildinfo ../*.changes 2>/dev/null || true

echo ""
echo "To install the package, run:"
echo "sudo dpkg -i ../gpustat-plus_*.deb"
echo ""
echo "If there are dependency issues, run:"
echo "sudo apt-get install -f"
echo ""
echo "Note: For NVIDIA GPU monitoring, also install:"
echo "pip3 install nvidia-ml-py"

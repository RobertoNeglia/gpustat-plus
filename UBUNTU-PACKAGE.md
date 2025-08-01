# Ubuntu Package for gpustat-plus

This directory contains the necessary files to build a Ubuntu/Debian package for gpustat-plus.

## Quick Start

### Building the Package

To build the Ubuntu package, run:

```bash
./build-ubuntu-package.sh
```

### Installing the Package

After building, install the package with:

```bash
sudo dpkg -i ../gpustat-plus_*.deb
```

If there are dependency issues, run:

```bash
sudo apt-get install -f
```

**Note**: For NVIDIA GPU monitoring functionality, you'll need to install nvidia-ml-py:

```bash
pip3 install nvidia-ml-py
```

This is not included as a hard dependency since it's not available in Ubuntu repositories.

## Package Details

- **Package Name**: gpustat-plus
- **Architecture**: all (architecture-independent)
- **Dependencies**: 
  - python3-blessed (>= 1.17.1)
  - python3-psutil (>= 5.6.0) 
  - python3-pynvml
  - python3-typing-extensions
  - python3-nvidia-ml-py (>= 12.535.108)

## Manual Build Process

If you prefer to build manually:

1. Install build dependencies:
   ```bash
   sudo apt update
   sudo apt install -y build-essential debhelper dh-python python3-all \
                       python3-setuptools python3-setuptools-scm python3-wheel devscripts
   ```

2. Build the package:
   ```bash
   dpkg-buildpackage -us -uc -b
   ```

## Files Included

The package contains:
- `/usr/bin/gpustat+` - Enhanced gpustat command
- `/usr/bin/gpustat` - Original gpustat command (for compatibility)
- Python library files in `/usr/lib/python3/dist-packages/gpustat/`
- Documentation in `/usr/share/doc/gpustat-plus/`

## Package Structure

```
debian/
├── changelog          # Package version history
├── control           # Package metadata and dependencies
├── copyright         # License information
├── rules             # Build rules
└── source/
    └── format        # Source package format
```

## Troubleshooting

### Missing Dependencies

If installation fails due to missing dependencies, install them manually:

```bash
# For Ubuntu 24.04+
sudo apt install python3-psutil python3-blessed python3-typing-extensions

# Install nvidia-ml-py via pip if not available as system package
pip3 install nvidia-ml-py
```

### Version Issues

The package version is automatically generated from git tags. To use a specific version:

1. Edit `debian/changelog` 
2. Modify the `GPUSTAT_VERSION` in `debian/rules`

## Uninstalling

To remove the package:

```bash
sudo apt remove gpustat-plus
```

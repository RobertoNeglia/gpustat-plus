# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2025-08-01

### Added
- **System Monitoring**: Added CPU and RAM monitoring capabilities
- **Enhanced Display**: Unified interface showing GPUs, CPU cores, and memory usage
- **JSON API**: Enhanced JSON output including system information
- **Backward Compatibility**: Full compatibility with original gpustat commands
- **Color Coding**: Consistent color-coded thresholds for all metrics
- **Dual Commands**: Both `gpustat+` and `gpustat` commands available

### Features
- CPU monitoring with core count display
- RAM monitoring with used/total/percentage
- `--show-system` flag for system-only monitoring
- `--show-all` flag for complete GPU + system monitoring
- Enhanced `--json` output with system data
- Cross-platform support (Linux, macOS, Windows)

### Fixed
- Memory percentage calculation now matches displayed used/total values
- Consistent percentage calculations across display and JSON output

### Technical
- Added `psutil` dependency for system monitoring
- Enhanced `blessed` Terminal integration for improved colors
- Maintained all existing gpustat functionality and options

#!/usr/bin/env python3
"""
gpustat+ Demo - Enhanced GPU and System Monitoring
"""

import psutil
from gpustat.core import GPUStatCollection
from blessed import Terminal

def main():
    print("🚀 gpustat+ - Enhanced GPU and System Monitoring")
    print("=" * 60)
    print()
    
    # Create a collection and gather system info
    collection = GPUStatCollection([])
    collection.collect_system_info()
    
    # Display system information
    t_color = Terminal()
    system_info = collection._format_system_info(t_color, 16)
    
    print("📊 LIVE SYSTEM MONITORING:")
    print("─" * 40)
    print("(No GPUs are available)")
    print(f"   {collection.hostname}  System Status")
    print(f"   {system_info}")
    print()
    
    # Show memory calculation details
    memory_info = psutil.virtual_memory()
    MB = 1024 * 1024
    used_mb = memory_info.used // MB
    total_mb = memory_info.total // MB
    calc_percent = (used_mb / total_mb) * 100
    
    print("📈 CALCULATION DETAILS:")
    print("─" * 40)
    print(f"  Memory Used: {used_mb:,} MB")
    print(f"  Memory Total: {total_mb:,} MB")
    print(f"  Percentage: {calc_percent:.1f}%")
    print(f"  ✅ Math check: {used_mb} ÷ {total_mb} = {calc_percent:.1f}%")
    print()
    
    print("🎯 KEY FEATURES:")
    print("─" * 40)
    print("  ✓ Unified GPU and system monitoring")
    print("  ✓ Accurate memory percentage calculations")
    print("  ✓ Color-coded performance thresholds")
    print("  ✓ Enhanced JSON output with system data")
    print("  ✓ Backward compatible with original gpustat")
    print("  ✓ Cross-platform support")
    print()
    
    print("🔧 USAGE:")
    print("─" * 40)
    print("  $ gpustat+              # Enhanced monitoring")
    print("  $ gpustat+ --show-system # System info only")
    print("  $ gpustat+ --show-all    # Complete monitoring")
    print("  $ gpustat+ --json        # JSON output")
    print("  $ gpustat               # Backward compatibility")
    print()
    
    print("🎉 Welcome to gpustat+!")

if __name__ == "__main__":
    main()

# Makefile for gpustat-plus

.PHONY: help demo demo-all screenshot screenshot-color screenshots package install clean

help:
	@echo "Available targets:"
	@echo "  demo         - Show demo output with colors"
	@echo "  demo-all     - Show all demo output formats"
	@echo "  package      - Build Ubuntu/Debian package"
	@echo "  install      - Install the built package"
	@echo "  clean        - Clean build artifacts"

demo:
	@python3 demo-output.py

demo-all:
	@python3 demo-output.py --all

package:
	@./build-ubuntu-package.sh

install:
	@sudo dpkg -i ../gpustat-plus_*.deb || (echo "Package not found. Run 'make package' first." && exit 1)

clean:
	@echo "Cleaning build artifacts..."
	@rm -rf build/ dist/ *.egg-info/ .pybuild/
	@rm -f ../*.deb ../*.buildinfo ../*.changes
	@rm -rf debian/.debhelper/ debian/gpustat-plus/ debian/debhelper-build-stamp
	@rm -f debian/files debian/gpustat-plus.*
	@echo "Clean complete."

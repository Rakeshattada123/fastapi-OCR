#!/usr/bin/env bash
# exit on error
set -o errexit

# 1. Install your Python dependencies
pip install -r requirements.txt

# 2. Update and install system dependencies
apt-get update
apt-get install -y tesseract-ocr tesseract-ocr-eng

# 3. Clean up the package cache to reduce image size
apt-get clean && rm -rf /var/lib/apt/lists/*
#!/usr/bin/env bash
# exit on error
set -o errexit

# Install Tesseract and its development files
echo "Installing Tesseract..."
sudo apt-get update
sudo apt-get install -y tesseract-ocr libtesseract-dev

# Install Python dependencies
echo "Installing Python packages..."
pip install -r requirements.txt

echo "Build complete."
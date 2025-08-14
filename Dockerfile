# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Install Tesseract OCR and other system dependencies
RUN apt-get update && apt-get install -y tesseract-ocr tesseract-ocr-eng \
    # Clean up
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the requirements file and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Command to run your app (example for a Flask/Gunicorn app)
CMD ["gunicorn", "--bind", "0.0.0.0:10000", "your_app_module:app"]
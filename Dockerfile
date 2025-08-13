# Start with a base image
FROM python:3.10-slim

# Set a working directory
WORKDIR /app

# IMPORTANT: Install Tesseract and any needed language packs
RUN apt-get update && apt-get install -y tesseract-ocr tesseract-ocr-eng \
    && rm -rf /var/lib/apt/lists/*

# Copy your requirements file and install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Command to run your application
CMD ["gunicorn", "my_app.wsgi"]
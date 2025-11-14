# Use lightweight Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirement file first (for better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your project
COPY . .

# Expose port (HuggingFace uses 7860 by default, but Flask is fine)
EXPOSE 7860

# Run your Flask app
CMD ["python", "app.py"]

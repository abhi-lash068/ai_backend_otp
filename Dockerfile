FROM python:3.10

# Set working directory
WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Expose port (Cloud Run uses 8080)
ENV PORT=8080

# Run with gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]

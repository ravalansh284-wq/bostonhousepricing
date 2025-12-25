# Pull the base image of the python
FROM python:3.7

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application into the container
COPY . .

# Expose the port app runs
EXPOSE $PORT


CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app
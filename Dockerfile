# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the requirements file into the container at /usr/src/app
COPY app/requirements.txt ./

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's code
COPY ./app .

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variables (optional)
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]

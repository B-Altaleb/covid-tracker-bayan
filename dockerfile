# Use a base image
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy the backend script.js file
COPY script.js .

# Copy the frontend index.html file
COPY index.html .

# Install dependencies
RUN npm init -y
RUN npm install express

# Expose the desired port
EXPOSE 3000

# Define the command to run the application
CMD ["node", "script.js"]

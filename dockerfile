# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the code files to the working directory
COPY . .

# Expose the port on which the application will run
EXPOSE 3000

# Define the command to run the application
CMD [ "node", "script.js" ]

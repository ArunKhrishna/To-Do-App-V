# Base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY TodoApp/package*.json ./
RUN npm install

# Copy the rest of the app
COPY TodoApp/ .

# Expose the port
EXPOSE 3000

# Start the app on port 3000
CMD ["npm", "start", "--", "--port", "3000"]

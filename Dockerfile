# Base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY TodoApp/package*.json ./
RUN npm install

# Copy the rest of the application
COPY TodoApp/ .

# Expose port (Render uses dynamic port assignment, but this is for local testing)
EXPOSE 8080

# Start the app - Render sets $PORT, which your app will now use
CMD ["npm", "start"]

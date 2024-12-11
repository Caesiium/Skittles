# Step 1: Use official Node.js image to build the app
FROM node:18 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app’s code
COPY . .

# Build the React app for production
RUN npm run build

# Step 2: Use Nginx to serve the app
FROM nginx:alpine

# Copy the build directory from the build stage to Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to be able to access the app in a browser
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]

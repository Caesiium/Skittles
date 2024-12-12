# Step 1: Use an official Node.js image
FROM node:18

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy package.json and package-lock.json (or yarn.lock) into the container
COPY package*.json ./

# Step 4: Install the dependencies
RUN npm install

# Step 5: Copy the rest of the application into the container
COPY . .

# Step 6: Expose the port that the server will run on
EXPOSE 8080

# Step 7: Run the application (assuming you are using a start script defined in package.json)
CMD ["node", "project.js"]

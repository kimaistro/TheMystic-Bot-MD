FROM node:lts-buster

# Install required dependencies
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the necessary files for npm install
COPY package.json pipdeps.js .

# Install dependencies
RUN npm install && npm install qrcode-terminal

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 5000

# Command to start the application
CMD ["node", "index.js", "--server"]

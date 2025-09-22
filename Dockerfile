FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
# If you don't have package-lock.json, npm ci will fail — change to npm install
RUN npm ci --only=production || npm install --production
COPY . .
EXPOSE 3000
CMD ["npm","start"]


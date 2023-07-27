import express from 'express';
import cors from 'cors';
import mongoose from 'mongoose';

const app = express();
const PORT = 5000;

// Connect to MongoDB
const MONGODB_URI = 'mongodb://neha:qwerty@localhost:27017/webserver';
mongoose.connect(MONGODB_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});
mongoose.connection.once('open', () => {
  console.log('Connected to MongoDB');
});

// Middleware
app.use(cors());
app.use(express.json());

// Your data schema and routes go here

app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
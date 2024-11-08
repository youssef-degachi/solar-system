// server.js
const express = require('express');
const cors = require('cors');
const admin = require('firebase-admin');
const serviceAccount = require('./serviceAccountKey.json'); // You'll need to add your Firebase service account key

// Initialize Firebase Admin
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();
const app = express();

app.use(cors());
app.use(express.json());

// Get all planets
app.get('/api/planets', async (req, res) => {
  try {
    const planetsSnapshot = await db.collection('planets').get();
    const planets = [];
    planetsSnapshot.forEach(doc => {
      planets.push({ id: doc.id, ...doc.data() });
    });
    res.json(planets);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get planet by ID
app.get('/api/planets/:id', async (req, res) => {
  try {
    const planetDoc = await db.collection('planets').doc(req.params.id).get();
    if (!planetDoc.exists) {
      res.status(404).json({ error: 'Planet not found' });
    } else {
      res.json({ id: planetDoc.id, ...planetDoc.data() });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Add new planet
app.post('/api/planets', async (req, res) => {
  try {
    const newPlanet = req.body;
    const docRef = await db.collection('planets').add(newPlanet);
    res.status(201).json({ id: docRef.id, ...newPlanet });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
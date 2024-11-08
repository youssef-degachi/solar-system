// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyB5eD5YhXU4LpiqqwSz__Ea42mR0SeKeX4",
  authDomain: "sloair-system.firebaseapp.com",
  projectId: "sloair-system",
  storageBucket: "sloair-system.firebasestorage.app",
  messagingSenderId: "1098148940934",
  appId: "1:1098148940934:web:6c1762125b16de1f751507",
  measurementId: "G-LFL98B1Z3C"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
// src/services/authService.js
import axios from 'axios';
import jwt_decode from 'jwt-decode';

const BASE_URL = process.env.NODE_ENV === 'production'
  ? 'https://uc-learning-hub-production.up.railway.app'
  : 'http://localhost:5000';

export const login = async (correo, password) => {
  const response = await axios.post(`${BASE_URL}/login`, { correo, password });
  const { token, usuario } = response.data;
  localStorage.setItem('authToken', token);
  localStorage.setItem('usuario', JSON.stringify(usuario));
  return token;
};

export const loginWithGoogle = async (credential) => {
  const userInfo = jwt_decode(credential);
  const response = await axios.post(`${BASE_URL}/auth`, {
    google_id: userInfo.sub,
    nombre: userInfo.name,
    correo: userInfo.email,
    imagen_perfil: userInfo.picture,
  });

  const { token, usuario } = response.data;
  localStorage.setItem('authToken', token);
  localStorage.setItem('usuario', JSON.stringify(usuario));
  return token;
};


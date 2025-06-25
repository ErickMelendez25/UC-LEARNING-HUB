import React from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom'; // Importa Navigate para redirigir
import DashboardHeader from './components/DashboardHeader';
import DashboardFooter from './components/DashboardFooter';
import DashboardMain from './components/DashboardMain';
import Login from './components/Login';
import VistaOpcion from './components/VistaOpcion';




import { GoogleOAuthProvider } from '@react-oauth/google';  // Importa el proveedor de Google OAuth

import IngenieriaPage from './carreras/IngenieriaPage';
import DerechoPage from './carreras/DerechoPage';
import MedicinaPage from './carreras/MedicinaPage';





import './styles/Global.css';

// Componente para proteger las rutas
function ProtectedRoute({ element }) {
  const isAuthenticated = localStorage.getItem('authToken'); // Verifica si el token de autenticación está presente
  return isAuthenticated ? element : <Navigate to="/" replace />; // Si no está autenticado, redirige al login
}

function App() {
  return (
    <GoogleOAuthProvider clientId="1070915456741-n664o61eunf4it4f94m52mqvg09h2d3b.apps.googleusercontent.com">
      <Router>
        <Routes>
          {/* Ruta para Login */}
          <Route path="/" element={<Login />} />
          <Route path="/login" element={<Login />} />

          {/* Ruta para Dashboard con protección */}
          <Route
            path="/dashboard"
            element={
              <ProtectedRoute
                element={
                  <>
                    <DashboardHeader />
                    <DashboardMain />
                    <DashboardFooter />
                  </>
                }
              />
            }
          />

          {/* Rutas dinámicas para las categorías */}
          <Route
            path="/dashboard/:categoria"
            element={
              <ProtectedRoute
                element={
                  <>
                    <DashboardHeader />
                    <DashboardMain />
                    <DashboardFooter />
                  </>
                }
              />
            }
          />

          {/* Otras rutas para las opciones */}
          <Route
            path="/dashboard/:opcion"
            element={
              <ProtectedRoute
                element={
                  <>
                    <DashboardHeader />
                    <VistaOpcion />
                    <DashboardFooter />
                  </>
                }
              />
            }
          >
            {/* Rutas para procesos específicos dentro de la opción */}

          </Route>



          <Route
            path="/dashboard/ingenieria"
            element={
              <ProtectedRoute
                element={
                  <>
                    <DashboardHeader />
                    <IngenieriaPage />
                    <DashboardFooter />
                  </>
                }
              />
            }
          />

          <Route
            path="/dashboard/derecho"
            element={
              <ProtectedRoute
                element={
                  <>
                    <DashboardHeader />
                    <DerechoPage />
                    <DashboardFooter />
                  </>
                }
              />
            }
          />

          <Route
            path="/dashboard/medicina"
            element={
              <ProtectedRoute
                element={
                  <>
                    <DashboardHeader />
                    <MedicinaPage />
                    <DashboardFooter />
                  </>
                }
              />
            }
          />



        </Routes>
      </Router>
    </GoogleOAuthProvider>
  );
}

export default App;

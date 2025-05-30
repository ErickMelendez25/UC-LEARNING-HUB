import { render, screen } from '@testing-library/react';
import Login from '../components/Login';  // Asegúrate de que la ruta sea correcta
import { GoogleOAuthProvider } from '@react-oauth/google';
import { BrowserRouter } from 'react-router-dom'; // Importa BrowserRouter

describe('Login', () => {
  it('renderiza el formulario de login correctamente', () => {
    render(
      <GoogleOAuthProvider clientId="1070915456741-n664o61eunf4it4f94m52mqvg09h2d3b.apps.googleusercontent.com">
        <BrowserRouter>
          <Login />
        </BrowserRouter>
      </GoogleOAuthProvider>
    );

    // Verifica que el formulario tiene el texto "Iniciar sesión"
    expect(screen.getByText('Iniciar sesión')).toBeInTheDocument();

    // Verifica que el campo para el correo está presente (utilizando el label "Correo")
    expect(screen.getByLabelText(/correo/i)).toBeInTheDocument();

    // Verifica que el campo para la contraseña está presente (utilizando el label "Contraseña")
    expect(screen.getByLabelText(/contraseña/i)).toBeInTheDocument();

    // Verifica que el botón de "Iniciar sesión" está presente
    expect(screen.getByRole('button', { name: /iniciar sesión/i })).toBeInTheDocument();

    // Verifica que el botón de login de Google está presente
    expect(screen.getByRole('button', { name: /iniciar sesión con google/i })).toBeInTheDocument();
  });
});

import React, { useState, useEffect, useRef } from 'react';
import { Link } from 'react-router-dom';
import {
  PieChart,
  Pie,
  Cell,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  Tooltip,
  Legend,
} from 'recharts';
import '../styles/DashboardMain.css';

const ADMIN_EMAIL = '72848846@continental.edu.pe';

const DashboardMain = () => {
  // Leer el objeto "usuario" completo que guardamos en el login
  const storedUsuario = JSON.parse(localStorage.getItem('usuario') || '{}');
  const storedEmail = storedUsuario.correo || '';

  // isAdmin se inicializa según el correo guardado
  const [isAdmin] = useState(storedEmail === ADMIN_EMAIL);

  const [backgroundVisible, setBackgroundVisible] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [highlightedIndex, setHighlightedIndex] = useState(null);
  const [searchError, setSearchError] = useState('');
  const optionRefs = useRef([]);

  const options = [
    { name: "Ingenierías", route: "/dashboard/ingenieria" },
    { name: "Tecnología Médica", route: "/dashboard/medicina" },
    { name: "Enfermería", route: "/dashboard/enfermeria" },
    { name: "Psicología", route: "/dashboard/psicologia" },
    { name: "Derecho", route: "/dashboard/derecho" },
    { name: "Ciencias de la Comunicación", route: "/dashboard/ciencias-comunicacion" },
    { name: "Administración", route: "/dashboard/administracion" },
    { name: "Arquitectura", route: "/dashboard/arquitectura" },
  ];

  // Datos de ejemplo para la vista administrativa
  const pieData = [
    { name: 'Ingeniería', value: 65 },
    { name: 'Derecho',     value: 35 },
  ];
  const barData = [
    { section: 'Usuarios',      count: 120 },
    { section: 'Reportes',      count: 80  },
    { section: 'Configuración', count: 50  },
  ];
  const COLORS = ['#0088FE', '#FFBB28'];

  // Manejo de selección y búsqueda
  const handleOptionClick = () => setBackgroundVisible(false);

  const handleSearch = () => {
    const idx = options.findIndex(o =>
      o.name.toLowerCase().includes(searchTerm.toLowerCase())
    );
    if (idx !== -1) {
      setHighlightedIndex(idx);
      setSearchError('');
    } else {
      setHighlightedIndex(null);
      setSearchError('No se encontró tu búsqueda');
    }
  };

  // Desactivar resaltado al hacer clic fuera
  useEffect(() => {
    const listener = e => {
      if (
        highlightedIndex !== null &&
        optionRefs.current[highlightedIndex] &&
        !optionRefs.current[highlightedIndex].contains(e.target)
      ) {
        setHighlightedIndex(null);
      }
    };
    document.addEventListener('mousedown', listener);
    return () => document.removeEventListener('mousedown', listener);
  }, [highlightedIndex]);

  // Enter para buscar
  useEffect(() => {
    const keyListener = e => {
      if (e.key === 'Enter') handleSearch();
    };
    window.addEventListener('keydown', keyListener);
    return () => window.removeEventListener('keydown', keyListener);
  });

  // Debug en consola
  console.log('[DashboardMain] storedEmail:', storedEmail);
  console.log('[DashboardMain] isAdmin:', isAdmin, 'path:', window.location.pathname);

  return (
    <div className={`dashboard-main ${!backgroundVisible ? 'hide-background' : ''}`}>
      {isAdmin && window.location.pathname === "/dashboard" ? (
        // ----- VISTA ADMINISTRATIVA -----
        <div className="admin-view">
          <h2>Panel Administrativo</h2>
          <div className="charts-container">
            <div className="pie-chart">
              <h3>Distribución Facultades</h3>
              <PieChart width={300} height={300}>
                <Pie
                  data={pieData}
                  cx="50%" cy="50%"
                  outerRadius={80}
                  label dataKey="value"
                >
                  {pieData.map((entry, i) => (
                    <Cell key={`cell-${i}`} fill={COLORS[i % COLORS.length]} />
                  ))}
                </Pie>
                <Tooltip />
                <Legend />
              </PieChart>
            </div>
            <div className="bar-chart">
              <h3>Secciones Habilitadas</h3>
              <BarChart width={400} height={300} data={barData}>
                <XAxis dataKey="section" />
                <YAxis />
                <Tooltip />
                <Bar dataKey="count" />
              </BarChart>
            </div>
          </div>
        </div>
      ) : window.location.pathname === "/dashboard" ? (
        // ----- VISTA NORMAL DEL DASHBOARD -----
        <>
          <div className="search-bar">
            <input
              type="text"
              placeholder="Buscar profesional..."
              value={searchTerm}
              onChange={e => setSearchTerm(e.target.value)}
              className="search-input"
            />
            <button onClick={handleSearch} className="search-btn">Buscar</button>
            {searchError && <span className="search-error">{searchError}</span>}
          </div>
          <div className="options-section">
            <div className="options-grid">
              {options.map((option, i) => (
                <Link
                  key={i}
                  to={option.route}
                  className={`option-btn ${highlightedIndex === i ? 'blink' : ''}`}
                  onClick={handleOptionClick}
                  ref={el => (optionRefs.current[i] = el)}
                >
                  {option.name}
                </Link>
              ))}
            </div>
          </div>
        </>
      ) : (
        // ----- VISTA PARA RUTAS HIJAS -----
        <div className="welcome-message">
          <h2>
            Welcome to:{' '}
            {window.location.pathname
              .replace('/dashboard/', '')
              .replace('-', ' ')
              .toUpperCase()}
          </h2>
        </div>
      )}
    </div>
  );
};

export default DashboardMain;

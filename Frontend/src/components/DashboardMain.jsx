import React, { useState, useEffect, useRef } from 'react';
import { Link } from 'react-router-dom';
import '../styles/DashboardMain.css';

const DashboardMain = () => {
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
    { name: "Derecho", route: "/dashboard/Derecho" },
    { name: "Ciencias de la Comunicación", route: "/dashboard/ciencias-comunicacion" },
    { name: "Administración", route: "/dashboard/administracion" },
    { name: "Arquitectura", route: "/dashboard/arquitectura" },
  ];

  const handleOptionClick = () => {
    setBackgroundVisible(false);
  };

  const handleSearch = () => {
    const index = options.findIndex(option =>
      option.name.toLowerCase().includes(searchTerm.toLowerCase())
    );

    if (index !== -1) {
      setHighlightedIndex(index);
      setSearchError('');
    } else {
      setHighlightedIndex(null);
      setSearchError('No se encontró tu búsqueda');
    }
  };

  // Quitar parpadeo al hacer clic fuera del botón resaltado
  useEffect(() => {
    const handleClickOutside = (e) => {
      if (
        highlightedIndex !== null &&
        optionRefs.current[highlightedIndex] &&
        !optionRefs.current[highlightedIndex].contains(e.target)
      ) {
        setHighlightedIndex(null);
      }
    };

    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, [highlightedIndex]);

  useEffect(() => {
    const handleKeyPress = (e) => {
      if (e.key === 'Enter') handleSearch();
    };
    window.addEventListener('keydown', handleKeyPress);
    return () => window.removeEventListener('keydown', handleKeyPress);
  });

  return (
    <div className={`dashboard-main ${!backgroundVisible ? 'hide-background' : ''}`}>
      {window.location.pathname === "/dashboard" ? (
        <>
        <div className="search-bar">
          <input
            type="text"
            placeholder="Buscar profesional..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="search-input"
          />
          <button onClick={handleSearch} className="search-btn">Buscar</button>
          {searchError && (
            <span className="search-error">{searchError}</span>
          )}
        </div>

          <div className="options-section">
            <div className="options-grid">
              {options.map((option, index) => (
                <Link
                  key={index}
                  to={option.route}
                  className={`option-btn ${highlightedIndex === index ? 'blink' : ''}`}
                  onClick={handleOptionClick}
                  ref={(el) => (optionRefs.current[index] = el)}
                >
                  {option.name}
                </Link>
              ))}
            </div>
          </div>
        </>
      ) : (
        <div className="welcome-message">
          <h2>
            Welcome to: {window.location.pathname.replace('/dashboard/', '').replace('-', ' ').toUpperCase()}
          </h2>
        </div>
      )}
    </div>
  );
};

export default DashboardMain;

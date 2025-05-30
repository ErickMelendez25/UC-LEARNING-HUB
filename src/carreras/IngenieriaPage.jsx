import React, { useState, useEffect } from 'react';
import ReactPlayer from 'react-player';
import './IngenieriaPage.css';

const videos = [
    {
        id: '1',
        title: 'Introducción a la Ingeniería',
        url: 'https://www.youtube.com/watch?v=Hf4MJH0jDb4',
        description: 'Conoce el rol de la ingeniería en la sociedad actual.',
        image: 'https://img.youtube.com/vi/Hf4MJH0jDb4/0.jpg', // Miniatura de YouTube
    },
    {
        id: '2',
        title: 'Fundamentos de Física',
        url: 'https://www.youtube.com/watch?v=17tqXgvCN0E',
        description: 'Conceptos básicos para estudiantes de ingeniería.',
        image: 'https://img.youtube.com/vi/17tqXgvCN0E/0.jpg', // Miniatura de YouTube
    },
    {
        id: '3',
        title: 'Matemática para Ingenieros',
        url: 'https://www.youtube.com/watch?v=g9eBJ5WT91A&t',
        description: 'Aplicación de matemáticas en problemas reales.',
        image: 'https://img.youtube.com/vi/g9eBJ5WT91A/0.jpg', // Miniatura de YouTube
    },
    
    {
        id: '4',
        title: 'Electrónica Básica',
        url: 'https://www.youtube.com/watch?v=sxIivFH1HUk',
        description: 'Entiende los principios de circuitos electrónicos.',
        image: 'https://img.youtube.com/vi/sxIivFH1HUk/0.jpg', // Miniatura de YouTube
    },
    {
        id: '5',
        title: 'Programación en C++',
        url: 'https://www.youtube.com/watch?v=zOjov-2OZ0E',
        description: 'Introducción al lenguaje de programación más usado.',
        image: 'https://img.youtube.com/vi/zOjov-2OZ0E/0.jpg', // Miniatura de YouTube
    },
    {
        id: '6',
        title: 'Mecánica Clásica',
        url: 'https://www.youtube.com/watch?v=8iW7bFvBI0s',
        description: 'Movimiento, fuerzas y leyes de Newton.',
        image: 'https://img.youtube.com/vi/8iW7bFvBI0s/0.jpg', // Miniatura de YouTube
    },
    {
        id: '7',
        title: 'Termodinámica',
        url: 'https://www.youtube.com/watch?v=RrBGyGZfKdw',
        description: 'Energía, calor y eficiencia de sistemas.',
        image: 'https://img.youtube.com/vi/RrBGyGZfKdw/0.jpg', // Miniatura de YouTube
    },
    {
        id: '8',
        title: 'Materiales de Ingeniería',
        url: 'https://www.youtube.com/watch?v=GQ0Y8tOXDA8',
        description: 'Propiedades de los materiales y su uso.',
        image: 'https://img.youtube.com/vi/GQ0Y8tOXDA8/0.jpg', // Miniatura de YouTube
    },
    {
        id: '9',
        title: 'Estructuras y Resistencia',
        url: 'https://www.youtube.com/watch?v=y1a0j4DJ1RI',
        description: 'Estática y resistencia de materiales.',
        image: 'https://img.youtube.com/vi/y1a0j4DJ1RI/0.jpg', // Miniatura de YouTube
    },
    {
        id: '10',
        title: 'Ética Profesional',
        url: 'https://www.youtube.com/watch?v=HqA6UeIFv4E',
        description: 'La ética en el ejercicio de la ingeniería.',
        image: 'https://img.youtube.com/vi/HqA6UeIFv4E/0.jpg', // Miniatura de YouTube
    },
];

const IngenieriaPage = () => {
    const [selectedVideo, setSelectedVideo] = useState(null);
    const [progress, setProgress] = useState({});
    const [paymentStatus, setPaymentStatus] = useState({});
    const [playedSeconds, setPlayedSeconds] = useState(0);
    const [duration, setDuration] = useState(0);

    useEffect(() => {
        const storedProgress = JSON.parse(localStorage.getItem('videoProgress')) || {};
        setProgress(storedProgress);
    }, []);

    useEffect(() => {
        localStorage.setItem('videoProgress', JSON.stringify(progress));
    }, [progress]);

    const handleProgress = (state) => {
        if (selectedVideo) {
            setPlayedSeconds(state.playedSeconds);
            const percent = Math.min(100, Math.round((state.playedSeconds / duration) * 100));
            setProgress((prev) => ({
                ...prev,
                [selectedVideo.id]: percent,
            }));
        }
    };

    const handleDuration = (d) => {
        setDuration(d);
    };

    const handlePayment = (videoId) => {
        setPaymentStatus((prevStatus) => ({
            ...prevStatus,
            [videoId]: true, 
        }));
    };

    return (
        <div className="page-container">

            <div className="video-grid">
                {videos.map((video) => (
                    <div key={video.id} className="video-card">
                        <img src={video.image} alt={video.title} className="video-image" />
                        <div className="progress-percentage">
                            {progress[video.id] || 0}%
                        </div>
                        <h3>{video.title}</h3>
                        <p>{video.description}</p>

                        {paymentStatus[video.id] ? (
                            <button
                                className="access-button"
                                onClick={() => setSelectedVideo(video)}
                            >
                                Ver Video
                            </button>
                        ) : (
                            <div>
                                <button
                                    className="access-button"
                                    onClick={() => handlePayment(video.id)}
                                >
                                    Realizar Pago
                                </button>
                                <p>Pago requerido para acceder al video.</p>
                            </div>
                        )}
                    </div>
                ))}
            </div>

            {selectedVideo && paymentStatus[selectedVideo.id] && (
            <div className="video-modal-fullscreen">
                <div className="video-modal-layout">
                    {/* Panel izquierdo: lista de videos */}
                    <div className="left-panel">
                        <h3>Contenido del curso</h3>
                        {videos.map((video) => (
                            <div
                                key={video.id}
                                className={`video-item ${selectedVideo.id === video.id ? 'active' : ''}`}
                                onClick={() => setSelectedVideo(video)}
                            >
                                <img src={video.image} alt={video.title} />
                                <p>{video.title}</p>
                            </div>
                        ))}
                    </div>

                    {/* Panel derecho: reproductor */}
                    <div className="right-panel">
                        <h2>{selectedVideo.title}</h2>
                        <ReactPlayer
                            url={selectedVideo.url}
                            controls
                            playing
                            width="100%"
                            height="500px"
                            onProgress={handleProgress}
                            onDuration={handleDuration}
                        />
                        <div className="progress-bar-container">
                        <div className="button-container">
                            <button onClick={() => setSelectedVideo(null)} className="return-button">
                                Regresar a los cursos
                            </button>
                        </div>
                        <div
                            className="progress-bar"
                            style={{ width: `${progress[selectedVideo.id] || 0}%` }}
                            />
                        </div>
                        <p>Avance: {progress[selectedVideo.id] || 0}%</p>
                        

                    </div>
                </div>
            </div>
        )}

        </div>
    );
};

export default IngenieriaPage;

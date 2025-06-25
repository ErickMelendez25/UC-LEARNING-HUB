import React, { useState, useEffect } from 'react';
import ReactPlayer from 'react-player';
import './IngenieriaPage.css';
import SimulatedMercadoPago from '../components/SimulatedMercadoPago';
import ChatBotBurbuja from '../components/ChatBotBurbuja';

const usuario = JSON.parse(localStorage.getItem("usuario"));
const nombreUsuario = usuario?.nombre || "Anónimo";
const userId = usuario?.id ?? 102;

const FREE_VIDEO_ID = '1';
const apiUrl = process.env.NODE_ENV === 'production'
  ? 'https://sateliterrreno-production.up.railway.app'
  : 'http://localhost:5000';

const IngenieriaPage = () => {
  const [videos, setVideos] = useState([]);
  const [likes, setLikes] = useState({});
  const [commentsByVideo, setCommentsByVideo] = useState({});
  const [paymentStatus, setPaymentStatus] = useState({});
  const [selectedVideo, setSelectedVideo] = useState(null);
  const [progress, setProgress] = useState({});
  const [duration, setDuration] = useState(0);
  const [selectedForPayment, setSelectedForPayment] = useState(null);
  const [commentInput, setCommentInput] = useState('');
  const [ratings, setRatings] = useState({});
  const [primerVideoId, setPrimerVideoId] = useState(null);

    useEffect(() => {
    fetch(`${apiUrl}/api/user/${userId}/ratings`)
      .then(res => res.ok ? res.json() : {})
      .then(data => setRatings(data))
      .catch(err => console.error("Error obteniendo ratings:", err));
  }, []);


useEffect(() => {
  fetch(`${apiUrl}/api/videos?userId=${userId}`)
    .then(res => res.ok ? res.json() : Promise.reject('Error en API'))
    .then(data => {
      const videosData = Array.isArray(data.videos) ? data.videos : [];



      setVideos(videosData);

      const likesMap = Object.fromEntries((data.likes || []).map(id => [id, true]));
      setLikes(likesMap);

      const paidMap = Object.fromEntries((data.paid || []).map(id => [id, true]));

      // Hacer gratuito el primer video
      if (videosData.length > 0) {
        const id = videosData[0].id;
        setPrimerVideoId(id); // ← guardamos el ID del primer video
        paidMap[id] = true; // marcar como gratuito
      }

      setPaymentStatus(paidMap);

      const comments = data.comments || [];
      const commentsGrouped = comments.reduce((acc, c) => {
        if (!acc[c.video_id]) acc[c.video_id] = [];
        acc[c.video_id].push({
          user: c.user || 'Usuario',
          text: c.comment || '',
          date: c.date || new Date().toISOString(),
        });
        return acc;
      }, {});
      setCommentsByVideo(commentsGrouped);
    })
    .catch(err => {
      console.error("Error cargando datos:", err);
      setVideos([]);
    });

  setProgress(JSON.parse(localStorage.getItem('videoProgress')) || {});
}, []);


  useEffect(() => {
    localStorage.setItem('videoProgress', JSON.stringify(progress));
  }, [progress]);

  const isFree = id => id.toString() === FREE_VIDEO_ID;
  const isUnlocked = id => isFree(id) || paymentStatus[id];





  const handleProgress = state => {
    if (!selectedVideo) return;
    const percent = Math.min(100, Math.round((state.playedSeconds / duration) * 100));
    setProgress(prev => ({ ...prev, [selectedVideo.id]: percent }));
    fetch(`${apiUrl}/api/videos/${selectedVideo.id}/behavior`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ event: 'watch', progress: percent, userId }),
    });
  };

  const handlePayment = videoId => {
    setPaymentStatus(prev => ({ ...prev, [videoId]: true }));
    fetch(`${apiUrl}/api/videos/${videoId}/behavior`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ event: 'payment', userId }),
    });
  };

  const handleLike = videoId => {
    setLikes(prev => ({ ...prev, [videoId]: true }));
    fetch(`${apiUrl}/api/videos/${videoId}/like`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ userId }),
    });
  };

  const handleComment = videoId => {
    if (!commentInput.trim()) return;
    const comment = {
      user: nombreUsuario,
      text: commentInput,
      date: new Date().toISOString(),
    };
    setCommentsByVideo(prev => ({
      ...prev,
      [videoId]: [...(prev[videoId] || []), comment]
    }));
    fetch(`${apiUrl}/api/videos/${videoId}/comment`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ userId, text: commentInput }),
    });
    setCommentInput('');
  };

  const handleRating = (videoId, star) => {
  setRatings(prev => ({ ...prev, [videoId]: star }));

  fetch(`${apiUrl}/api/videos/${videoId}/rate`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ userId, rating: star }),
  });
};

  return (
    <div className="page-container">
      <div className="video-grid">
        {videos.length > 0 ? (
          videos.map(video => (
            <div key={video.id} className="card"> 
            <img src={video.image || 'default.jpg'} alt={video.title} className="thumbnail" />

              <div className="card-body">
                <span
                  className={`like-icon ${likes[video.id] ? 'liked' : ''}`}
                  onClick={() => handleLike(video.id)}
                  title="Me gusta"
                >♥</span>

                <h3>{video.title}</h3>
                <h4 className="docente-nombre">Dictado por: {video.docente_nombre || 'Docente no especificado'}</h4>
                <p className="curso-nombre">Curso: {video.titulo}</p>
                <p className="curso-nombre">Curso: {video.curso_nombre}</p>

                <p>{video.description}</p>

                <div className="progress-bar-small">
                  <div style={{ width: `${progress[video.id] || 0}%` }} className="progress-inner" />
                </div>
                <p className="progress-label">{progress[video.id] || 0}% completado</p>

                {isUnlocked(video.id) ? (
                  <button className="btn" onClick={() => setSelectedVideo(video)}>
                    {video.id === primerVideoId ? 'Video Gratuito' : 'Ver Video'}
                  </button>
                ) : (
                  <>
                    <button className="btn" onClick={() => setSelectedForPayment(video)}>Realizar Pago</button>
                    <p className="requerido">Pago requerido</p>
                  </>
                )}
              </div>

            </div>
          ))
        ) : (
          <p>No hay videos disponibles.</p>
        )}
      </div>

      {selectedVideo && isUnlocked(selectedVideo.id) && (
        <div className="modal">
          <div className="modal-content two-columns">
            <div className="left-column">
              <ReactPlayer
                url={selectedVideo.url}
                controls playing width="100%" height="300vh"
                onProgress={handleProgress}
                onDuration={setDuration}
              />
              <h2>{selectedVideo.title}</h2>
              <p>Avance: {progress[selectedVideo.id] || 0}%</p>
              <div className="rating-stars">
                {[1, 2, 3, 4, 5].map(star => (
                  <span
                    key={star}
                    className={`star ${ratings[selectedVideo.id] >= star ? 'filled' : ''}`}
                    onClick={() => handleRating(selectedVideo.id, star)}
                  >★</span>
                ))}
              </div>
              <div className="btn-group">
                <button className="btn cerrar" onClick={() => setSelectedVideo(null)}>Cerrar</button>
                <button className="btn regresar" onClick={() => setSelectedVideo(null)}>← Regresar</button>
              </div>
            </div>
            <div className="right-column">
              <h3>Comentarios</h3>
              <div className="comentarios">
                {(commentsByVideo[selectedVideo.id] || []).map((c, i) => (
                  <div key={i} className="comentario-item">
                    <p><strong>{c.user}:</strong> {c.text}</p>
                    <span>{new Date(c.date).toLocaleString()}</span>
                  </div>
                ))}
              </div>
              <textarea
                placeholder="Escribe un comentario..."
                value={commentInput}
                onChange={e => setCommentInput(e.target.value)}
              />
              <button className="btn comentar" onClick={() => handleComment(selectedVideo.id)}>Comentar</button>
            </div>
          </div>
        </div>
      )}

      {selectedForPayment && (
        <SimulatedMercadoPago
          video={selectedForPayment}
          onPaymentSuccess={() => handlePayment(selectedForPayment.id)}
          onClose={() => setSelectedForPayment(null)}
        />
      )}

      <ChatBotBurbuja />
    </div>
  );
};

export default IngenieriaPage;

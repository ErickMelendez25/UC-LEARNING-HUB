import React, { useState } from 'react';

const questions = [
  {
    text: '¿Te interesa ayudar a las personas a mejorar su salud?',
    options: ['Sí, mucho', 'No tanto'],
    scores: { Medicina: 2, Ingenieria: 0 },
  },
  {
    text: '¿Te sientes cómodo viendo sangre o situaciones médicas?',
    options: ['Sí', 'Prefiero evitarlo'],
    scores: { Medicina: 2, Ingenieria: 0 },
  },
  {
    text: '¿Te gusta estudiar biología o anatomía?',
    options: ['Sí, me encanta', 'No es lo mío'],
    scores: { Medicina: 2, Ingenieria: 0 },
  },
  {
    text: '¿Disfrutas trabajar en equipo para resolver casos clínicos?',
    options: ['Sí', 'Prefiero trabajar solo'],
    scores: { Medicina: 2, Ingenieria: 0 },
  },
  {
    text: '¿Te atrae más el trabajo en hospitales que en oficinas?',
    options: ['Sí', 'No'],
    scores: { Medicina: 2, Ingenieria: 0 },
  },
  // Puedes agregar más preguntas aquí hasta llegar a 20
];

const MedicinaQuiz = () => {
  const [current, setCurrent] = useState(0);
  const [scores, setScores] = useState({ Medicina: 0, Ingenieria: 0 });
  const [finished, setFinished] = useState(false);

  const handleAnswer = (index) => {
    const scoreUpdate = questions[current].scores;
    const newScores = { ...scores };

    // Si eligió la primera opción, sumamos puntaje
    if (index === 0) {
      Object.entries(scoreUpdate).forEach(([career, score]) => {
        newScores[career] += score;
      });
    }

    setScores(newScores);

    if (current + 1 < questions.length) {
      setCurrent(current + 1);
    } else {
      setFinished(true);
    }
  };

  const getResult = () => {
    const sorted = Object.entries(scores).sort((a, b) => b[1] - a[1]);
    return sorted.slice(0, 2);
  };

  return (
    <div style={{ maxWidth: '600px', margin: '0 auto', fontFamily: 'Arial' }}>
      {!finished ? (
        <div style={{ padding: '20px', border: '1px solid #ccc', borderRadius: '12px' }}>
          <h3>Pregunta {current + 1} de {questions.length}</h3>
          <p style={{ fontSize: '18px' }}>{questions[current].text}</p>
          <div style={{ marginTop: '15px' }}>
            {questions[current].options.map((option, idx) => (
              <button
                key={idx}
                onClick={() => handleAnswer(idx)}
                style={{
                  display: 'block',
                  margin: '10px 0',
                  padding: '10px 15px',
                  fontSize: '16px',
                  cursor: 'pointer',
                  borderRadius: '8px',
                  backgroundColor: '#1976d2',
                  color: '#fff',
                  border: 'none',
                  width: '100%',
                }}
              >
                {option}
              </button>
            ))}
          </div>
        </div>
      ) : (
        <div style={{ textAlign: 'center', padding: '20px' }}>
          <h2>🎓 Resultado del Test Vocacional</h2>
          {getResult().map(([career, score], index) => (
            <p key={career} style={{ fontSize: '18px' }}>
              {index + 1}. {career} — {score} puntos
            </p>
          ))}
          <p style={{ marginTop: '15px' }}>
            Según tus respuestas, estas son las carreras que mejor se alinean contigo.
          </p>
        </div>
      )}
    </div>
  );
};

export default MedicinaQuiz;

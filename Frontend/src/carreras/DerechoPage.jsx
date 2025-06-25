import React from 'react';

const SaludPage = () => {
  return (
    <div className="facultad-page" style={{ padding: '20px', fontFamily: 'Arial' }}>
      <h2>🩺 Centro de Información en Salud – Cerro de Pasco</h2>

      <p>
        Bienvenido al módulo de salud. Aquí encontrarás información clave para prevenir enfermedades comunes en nuestra región, 
        especialmente relacionadas con la contaminación, la nutrición y el cuidado comunitario.
      </p>

      <section style={{ marginTop: '20px' }}>
        <h3>🌬️ Enfermedades respiratorias</h3>
        <ul>
          <li>Evita exponerte a polvo o aire contaminado, usa mascarilla si vives cerca a zonas mineras.</li>
          <li>Ventila tu casa diariamente para renovar el aire.</li>
          <li>Si tienes tos persistente, acude a un centro médico.</li>
        </ul>
      </section>

      <section style={{ marginTop: '20px' }}>
        <h3>🥬 Prevención de la anemia</h3>
        <ul>
          <li>Consume alimentos ricos en hierro como hígado, sangrecita, lentejas, espinaca.</li>
          <li>Toma agua hervida y limpia para evitar parásitos que causan anemia.</li>
          <li>Visita campañas de salud para chequeos gratuitos.</li>
        </ul>
      </section>

      <section style={{ marginTop: '20px' }}>
        <h3>🧼 Higiene personal y comunitaria</h3>
        <ul>
          <li>Lávate las manos con agua y jabón antes de comer y después de ir al baño.</li>
          <li>Evita tirar basura en la calle o ríos. Protejamos el medio ambiente.</li>
        </ul>
      </section>

      <section style={{ marginTop: '20px' }}>
        <h3>📢 Próximas campañas de salud en tu zona</h3>
        <p><strong>📍 Centro de salud Uliachín – 18 de mayo:</strong> Evaluación nutricional y despistaje de anemia.</p>
        <p><strong>📍 Plaza Chaupimarca – 25 de mayo:</strong> Charlas sobre prevención del cáncer y salud mental.</p>
      </section>

      <section style={{ marginTop: '30px', padding: '15px', backgroundColor: '#f0f8ff', borderRadius: '8px' }}>
        <h4>💡 ¿Sabías que...?</h4>
        <p>
          El 70% de la población de Cerro de Pasco está expuesta a altos niveles de metales pesados. 
          Proteger tu salud empieza por informarte. Comparte este espacio con tu familia y amigos.
        </p>
      </section>
    </div>
  );
};

export default SaludPage;

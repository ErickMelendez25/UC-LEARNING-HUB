import React from 'react';
import './SimulatedMercadoPago.css'; // si deseas estilos

const SimulatedMercadoPago = ({ video, onPaymentSuccess, onClose }) => {
  const handleSimulatedPayment = () => {
    // Simulamos un pago exitoso después de 1 segundo
    setTimeout(() => {
      onPaymentSuccess(video.id);
      onClose();
    }, 1000);
  };

  return (
        <div className="payment-modal">
        <div className="payment-modal-content">
            <h2>Realizar pago para: {video.title}</h2>
            <div className="payment-buttons">
            <button onClick={handleSimulatedPayment} className="confirm-button">Pagar ahora</button>
            <button onClick={onClose} className="cancel-button">Cancelar</button>
            </div>
        </div>
        </div>

  );
};

export default SimulatedMercadoPago;

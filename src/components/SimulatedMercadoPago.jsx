import React from 'react';
import './SimulatedMercadoPago.css'; // si deseas estilos

const SimulatedMercadoPago = ({ courseTitle, onConfirm, onCancel }) => {
    return (
        <div className="payment-modal">
            <div className="payment-modal-content">
                <h2>Pago Simulado - Mercado Pago</h2>
                <p>¿Deseas realizar el pago por el curso <strong>{courseTitle}</strong>?</p>
                <div className="payment-buttons">
                    <button onClick={onConfirm} className="confirm-button">Pagar</button>
                    <button onClick={onCancel} className="cancel-button">Cancelar</button>
                </div>
            </div>
        </div>
    );
};

export default SimulatedMercadoPago;

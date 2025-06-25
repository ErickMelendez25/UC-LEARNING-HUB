import React, { useState } from 'react';
import { Bot, X, Send } from 'lucide-react';
import './ChatBotBurbuja.css';
import { GoogleGenerativeAI } from '@google/generative-ai';

const genAI = new GoogleGenerativeAI(import.meta.env.VITE_GEMINI_API_KEY);

// Función para formatear respuestas: código en bloque y listas numeradas con negrita
function formatResponse(text) {
  const lines = text.split('\n');
  let inCodeBlock = false;
  const elements = [];

  lines.forEach((line, index) => {
    if (line.trim().startsWith('```')) {
      inCodeBlock = !inCodeBlock;
      if (!inCodeBlock) elements.push(<br key={index} />);
      return;
    }

    if (inCodeBlock) {
      elements.push(
        <code
          key={index}
          style={{
            display: 'block',
            background: '#2d2d2d',
            color: '#f8f8f2',
            padding: '8px',
            borderRadius: '6px',
            fontFamily: 'monospace',
            whiteSpace: 'pre-wrap',
            marginBottom: '10px',
          }}
        >
          {line}
        </code>
      );
    } else if (/^\s*\d+\.\s/.test(line)) {
      elements.push(
        <p key={index} style={{ marginBottom: '6px' }}>
          <strong>{line.match(/^\s*(\d+)\./)[1]}. </strong>
          {line.replace(/^\s*\d+\.\s/, '')}
        </p>
      );
    } else {
      if (line.trim() === '') {
        elements.push(<br key={index} />);
      } else {
        elements.push(
          <p key={index} style={{ marginBottom: '8px' }}>
            {line}
          </p>
        );
      }
    }
  });

  return elements;
}

const ChatBotBurbuja = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [messages, setMessages] = useState([
    { from: 'bot', text: '¡Hola! ¿En qué puedo ayudarte con los cursos de ingeniería?' },
  ]);
  const [input, setInput] = useState('');
  const [isLoading, setIsLoading] = useState(false);

  const toggleChat = () => setIsOpen(!isOpen);

  const handleSend = async () => {
    if (input.trim() === '') return;

    const userMessage = { from: 'user', text: input };
    setMessages((prev) => [...prev, userMessage]);
    setInput('');
    setIsLoading(true);

    try {
      const model = genAI.getGenerativeModel({ model: 'gemini-1.5-flash' });
      const result = await model.generateContent([input]);
      const response = await result.response.text();

      setMessages((prev) => [...prev, { from: 'bot', text: response }]);
    } catch (error) {
      console.error('Error con Gemini:', error);
      setMessages((prev) => [
        ...prev,
        {
          from: 'bot',
          text: 'Ocurrió un error al conectarse con Gemini. Inténtalo más tarde.',
        },
      ]);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="chatbot-container">
      <div className={`chat-window ${isOpen ? 'open' : ''}`}>
        <div className="chat-header">
          <span>Asistente IA</span>
          <X onClick={toggleChat} className="close-icon" />
        </div>
        <div className="chat-messages">
          {messages.map((msg, i) => (
            <div key={i} className={`chat-message ${msg.from}`}>
              {msg.from === 'bot' ? formatResponse(msg.text) : msg.text}
            </div>
          ))}
          {isLoading && <div className="chat-message bot">Escribiendo...</div>}
        </div>
        <div className="chat-input">
          <input
            type="text"
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyDown={(e) => e.key === 'Enter' && handleSend()}
            placeholder="Escribe tu mensaje..."
          />
          <button onClick={handleSend}>
            <Send size={18} />
          </button>
        </div>
      </div>
      <button className="chatbot-bubble" onClick={toggleChat}>
        <Bot size={24} />
      </button>
    </div>
  );
};

export default ChatBotBurbuja;

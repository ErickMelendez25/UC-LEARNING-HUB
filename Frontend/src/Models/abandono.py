from flask import Flask, request, jsonify
import pickle
import numpy as np

app = Flask(__name__)

# Carga el modelo entrenado
with open(r'D:\EDUCORE MODELO\modelo_abandono.pkl', 'rb') as f:
    modelo = pickle.load(f)

@app.route('/predict_abandono', methods=['POST'])
def predict_abandono():
    data = request.get_json()

    # Validación básica
    required_fields = ['evento', 'progreso', 'tiene_comentario']
    if not all(field in data for field in required_fields):
        return jsonify({'error': 'Faltan campos requeridos'}), 400

    # Extrae características
    evento = int(data['evento'])  # Debe estar codificado igual que en entrenamiento
    progreso = float(data['progreso'])
    tiene_comentario = int(data['tiene_comentario'])

    X = np.array([[evento, progreso, tiene_comentario]])
    prediction = modelo.predict(X)[0]
    proba = modelo.predict_proba(X)[0][1]

    return jsonify({
        'abandona': bool(prediction),
        'probabilidad': round(proba, 2)
    })

if __name__ == '__main__':
    app.run(debug=True, port=5001)

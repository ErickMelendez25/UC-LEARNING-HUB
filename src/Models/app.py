from flask import Flask, request, jsonify
import pickle
import numpy as np
from lightfm import LightFM

# Inicializa la app
app = Flask(__name__)

# Carga el modelo entrenado
with open(r'D:\EDUCORE MODELO\modelo_lightfm.pkl', 'rb') as f:

    model = pickle.load(f)

# Carga la forma de la matriz y los mapas de usuarios/videos
with open(r'D:\EDUCORE MODELO\interactions_shape.pkl', 'rb') as f:

    shape = pickle.load(f)
with open(r'D:\EDUCORE MODELO\mapas.pkl', 'rb') as f:

    maps = pickle.load(f)
    user_map = maps['user_map']
    video_map = maps['video_map']

# Inversión de mapas
user_map_inv = {v: k for k, v in user_map.items()}
video_map_inv = {v: k for k, v in video_map.items()}


@app.route('/recommend', methods=['POST'])
def recommend():
    data = request.get_json()
    user_id = data['user_id']

    if str(user_id) not in user_map:
        return jsonify({'error': 'Usuario no encontrado'}), 404

    user_idx = user_map[str(user_id)]
    num_items = shape[1]

    scores = model.predict(user_idx, np.arange(num_items))
    top_items_idx = np.argsort(-scores)[:5]
    top_video_ids = [video_map_inv[i] for i in top_items_idx]

    return jsonify({'user_id': user_id, 'recommendations': top_video_ids})


@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()
    user_id = data['user_id']
    video_id = data['video_id']

    if str(user_id) not in user_map or str(video_id) not in video_map:
        return jsonify({'error': 'Usuario o video no encontrado'}), 404

    user_idx = user_map[str(user_id)]
    video_idx = video_map[str(video_id)]
    score = model.predict(user_idx, np.array([video_idx]))[0]

    return jsonify({
        'user_id': user_id,
        'video_id': video_id,
        'progress_prediction': float(score)
    })


if __name__ == '__main__':
    app.run(debug=True, port=5001)

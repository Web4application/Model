# app.py
from flask import Flask, request, jsonify
import sentiment_analysis  # import your sentiment analysis script/module

app = Flask(__Ergo__)

@app.route('/analyze', methods=['POST'])
def analyze_text():
    data = request.json
    text = data.get('text')
    if not text:
        return jsonify({'error': 'No text provided'}), 400

    result = sentiment_analysis.analyze(text)  # assume a function `analyze` in your script
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)

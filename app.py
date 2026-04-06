from flask import Flask, render_template, request, jsonify
import os
import sys

# Add the Audio_Malayalam directory to the path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'Audio_Malayalam'))

try:
    import newspapermodule
except ImportError:
    newspapermodule = None

app = Flask(__name__)

# Configuration
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024  # 16MB max file size

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/extract', methods=['POST'])
def extract_news():
    try:
        data = request.json
        input_type = data.get('type', 'url')
        input_value = data.get('value', '').strip()
        
        if not input_value:
            return jsonify({'error': 'Please enter URL or text'}), 400
        
        if input_type == 'url':
            # Extract from URL
            if not newspapermodule:
                return jsonify({'error': 'Newspaper module not loaded'}), 500
            
            try:
                title = newspapermodule.mainmodule1(input_value)
                authors = newspapermodule.mainmodule2(input_value)
                text = newspapermodule.mainmodule3(input_value)
                
                return jsonify({
                    'success': True,
                    'title': title,
                    'authors': str(authors),
                    'text': text
                })
            except Exception as e:
                return jsonify({'error': f'Failed to extract from URL: {str(e)}'}), 400
        else:
            # Use provided text as-is
            return jsonify({
                'success': True,
                'title': 'User Provided Text',
                'authors': ['User'],
                'text': input_value
            })
    
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/generate-audio', methods=['POST'])
def generate_audio():
    try:
        data = request.json
        text = data.get('text', '').strip()
        
        if not text:
            return jsonify({'error': 'No text provided'}), 400
        
        if not newspapermodule:
            return jsonify({'error': 'Audio generation not available'}), 500
        
        try:
            from gtts import gTTS
            import time
            
            # Generate audio
            audio_obj = gTTS(text=text, lang='ml', slow=False)
            audio_path = 'static/audio/output.mp3'
            
            # Create directory if it doesn't exist
            os.makedirs(os.path.dirname(audio_path), exist_ok=True)
            
            audio_obj.save(audio_path)
            
            return jsonify({
                'success': True,
                'message': 'Audio generated successfully',
                'audio_url': '/' + audio_path
            })
        except Exception as e:
            return jsonify({'error': f'Failed to generate audio: {str(e)}'}), 400
    
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)

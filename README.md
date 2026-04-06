# Voice Newspaper Web Scraping System

## 📋 Overview

A comprehensive Python-based system that extracts news content from websites or user input and converts it into audio using browser-based Text-to-Speech (TTS). Designed for visually impaired users, it supports English, Hindi, Tamil, and Malayalam.

## ✨ Features

- **Web Scraping**: Extract news articles from newspaper websites
- **Text Extraction**: Remove unwanted content (ads, headers, footers) to get genuine article content
- **Text-to-Speech**: Convert extracted text into audio format
- **Multi-Language Support**: Available in English, Hindi, and Tamil
- **PDF to Audio**: Convert PDF documents to audio files
- **Audio to Text**: Convert audio files back to text format
- **Interactive GUI**: User-friendly Tkinter-based interface
- **Browser Integration**: Automatic display of results in the default system browser
- **Radio Button Feature**: Choose input mode (URL or Text)
- **Play, Pause, Stop Controls**: Control playback in the browser

## 📁 Project Structure

```
Voice-Newspaper-Web-Scrapping-System-For-Visually-Impaired-Person-Python3-/
├── Audio_English/                 # English language module
│   ├── gui.py                     # GUI interface
│   ├── newspapermodule.py         # Web scraping & TTS logic
│   ├── script.js                  # JavaScript for browser TTS
│   ├── style.css                  # CSS for GUI
│   ├── output.html                # Output file
│   └── ...
├── Audio_Hindi/                   # Hindi language module
│   ├── gui.py
│   ├── newspapermodule.py
│   ├── beautifulsoup.py
│   └── output.html
├── Audio_Tamil/                   # Tamil language module
│   ├── gui.py
│   ├── newspapermodule.py
│   ├── beautifulsoup.py
│   └── output.html
├── Audio_Malayalam/               # Malayalam language module
│   ├── gui.py
│   ├── newspapermodule.py
│   ├── beautifulsoup.py
│   └── output.html
├── pdf_audio/                     # PDF processing
│   └── pdf_to_audio.py           # Converts PDF files to audio
├── to_text/                       # Audio processing
│   ├── audio_to_text.py          # Audio to text converter
│   ├── speech_game.py            # Speech-based game module
│   ├── speech.py                 # Speech recognition module
│   └── word_s.py                 # Word learning module
└── README.md                      # This file
```

## 🛠️ Dependencies

### Required Python Packages

```
newspaper3k>=0.0.9
gtts>=2.0.0
PyPDF2>=1.26.0
pyttsx3>=2.0.0
speech_recognition>=3.8.0
beautifulsoup4>=4.0.0
Pillow>=8.0.0
```

### System Requirements

- Python 3.x
- Working internet connection (for web scraping)
- Audio playback capability
- Tkinter (usually included with Python)
- Google Speech-to-Text API access (for audio recognition)

## 📦 Installation

1. **Clone or download the project**

2. **Install Python dependencies**
   ```bash
   pip install newspaper3k gtts PyPDF2 pyttsx3 speech_recognition beautifulsoup4 Pillow
   ```

3. **Alternative: Install from requirements (if available)**
   ```bash
   pip install -r requirements.txt
   ```

## 🚀 Usage

### Running the English Interface

```bash
cd Audio_English
python gui.py
```

### Running the Hindi Interface

```bash
cd Audio_Hindi
python gui.py
```

### Running the Tamil Interface

```bash
cd Audio_Tamil
python gui.py
```

### Running the Malayalam Interface

```bash
cd Audio_Malayalam
python gui.py
```

### PDF to Audio Conversion

```bash
cd pdf_audio
python pdf_to_audio.py
```

### Audio to Text Conversion

```bash
cd to_text
python audio_to_text.py
```

## 📖 How to Use

### 1. Run the GUI

Go to your desired language folder (e.g., `Audio_English`):
```bash
cd Audio_English
python gui.py
```

### 2. Choose Input Mode

- **Read from URL**: Paste a news article URL in the textbox.
- **Read from Text**: Type or paste any paragraph you want to hear.

### 3. Click the Main Button

- The browser will open and read the text aloud automatically.
- Use Play, Pause, Stop buttons to control playback.

### 4. Automated Workflow Test

To verify the full workflow (static text and URL):
```bash
python ../test_workflow.py
```
- This will test both static text and URL extraction, generate output.html, and open it in your browser.

## 📂 Project Structure

```
Voice-Newspaper-Web-Scraping/
├── Audio_English/
│   ├── gui.py
│   ├── newspapermodule.py
│   ├── script.js
│   ├── style.css
│   ├── output.html
│   └── ...
├── Audio_Hindi/
├── Audio_Tamil/
├── Audio_Malayalam/
├── test_workflow.py
└── README.md
```

## How It Works

1. User selects input mode (URL or Text) in the GUI.
2. Enters a URL or static text.
3. System extracts or uses the text, generates output.html with TTS integration.
4. Browser opens output.html and reads the article aloud.

## Credits

- Original project by Suresh Kumar (NIT Trichy)
- TTS integration and modern UI by your team

## Support

For help, contact the project maintainer or open an issue.

# Voice Newspaper Web Scraping System for Visually Impaired Persons

## 📋 Overview

A comprehensive Python-based system that extracts news content from websites and converts it into audio format, making newspapers accessible to visually impaired individuals. The system scrapes newspaper articles, removes unwanted content (ads, etc.), and converts the extracted text into speech in multiple languages.

## ✨ Features

- **Web Scraping**: Extract news articles from newspaper websites
- **Text Extraction**: Remove unwanted content (ads, headers, footers) to get genuine article content
- **Text-to-Speech**: Convert extracted text into audio format
- **Multi-Language Support**: Available in English, Hindi, and Tamil
- **PDF to Audio**: Convert PDF documents to audio files
- **Audio to Text**: Convert audio files back to text format
- **Interactive GUI**: User-friendly Tkinter-based interface
- **Browser Integration**: Automatic display of results in the default system browser

## 📁 Project Structure

```
Voice-Newspaper-Web-Scrapping-System-For-Visually-Impaired-Person-Python3-/
├── Audio_English/                 # English language module
│   ├── gui.py                     # GUI interface
│   ├── newspapermodule.py         # Web scraping & TTS logic
│   ├── beautifulsoup.py           # HTML parsing utilities
│   └── output.html                # Output file
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

### Web Scraping and Audio Conversion

1. Launch the application by running `python gui.py` from your language folder
2. Select or paste a newspaper article URL in the input field
3. Confirm that you have selected the correct URL
4. Click the **"VIEW RESULT"** button
5. The article will open in your default browser
6. The extracted text will automatically be converted to audio
7. Listen to the audio output

### PDF to Audio Conversion

1. Run `python pdf_to_audio.py` from the `pdf_audio` folder
2. Select a PDF file from the file dialog
3. Click "Speak Text" to convert to audio
4. Click "Stop" to stop the audio playback

### Audio to Text Conversion

1. Run `python audio_to_text.py` from the `to_text` folder
2. Provide the audio file name with extension when prompted
3. The system will convert the audio to text using Google Speech Recognition

## 🎯 Key Modules

### `newspapermodule.py`
Handles article extraction and text-to-speech conversion. Main functions:
- `mainmodule1(url)`: Extracts article title
- `mainmodule2(url)`: Extracts author information
- `mainmodule3(url)`: Extracts article text
- `mainmodule(url)`: Main function that orchestrates the entire process

### `gui.py`
Provides the Graphical User Interface using Tkinter with options for:
- URL input
- Viewing results
- Help and information dialogs
- Browser and contact information

### `pdf_to_audio.py`
Converts PDF documents to audio using:
- PyPDF2 for PDF text extraction
- Google Text-to-Speech or pyttsx3 for audio generation

### `audio_to_text.py`
Converts audio files to text using Google Speech Recognition API

## 🔧 Supported Browsers

- Internet Explorer
- Google Chrome
- Mozilla Firefox
- Safari

## 👥 Contributing

This project was originally developed by **Suresh Kumar** from NIT Trichy, MCA Computer Science Department, under the guidance of **Dr. S. Sangeetha**, Assistant Professor of Computer Applications.

## 📞 Contact

**Developer**: Suresh Kumar
- **Mobile**: 9470779814
- **Email**: sureshkaum07896@gmail.com

## 📝 License

Please check with the original developers for licensing information.

## 🤝 Purpose

This software is designed to promote accessibility and independence for visually impaired individuals by providing an innovative solution to consume newspaper content through audio. It extracts genuine text content by removing unwanted elements like advertisements and focuses on delivering the core news content.

## 🐛 Troubleshooting

- **No audio output**: Ensure your system audio is working and the required TTS libraries are installed
- **Web scraping fails**: Check internet connection and verify the article URL is valid
- **PDF conversion issues**: Ensure the PDF file is not password-protected
- **Speech recognition errors**: Check Google API access and microphone permissions

## 🚀 Future Enhancements

- Support for more languages
- Desktop notification alerts for new articles
- Bookmarking and saving favorite articles
- Offline audio file storage
- Integration with multiple news sources
- Improved accessibility features

---

**Note**: This project aims to make newspaper content accessible to visually impaired individuals. For any issues or suggestions, please contact the developers.

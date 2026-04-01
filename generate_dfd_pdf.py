from fpdf import FPDF
from datetime import datetime

class DFDReport(FPDF):
    def header(self):
        self.set_font("Helvetica", "B", 16)
        self.cell(0, 10, "Voice Newspaper Web Scraping System", 0, 1, "C")
        self.set_font("Helvetica", "I", 10)
        self.cell(0, 10, "Data Flow Diagram & Documentation", 0, 1, "C")
        self.ln(10)

    def footer(self):
        self.set_y(-15)
        self.set_font("Helvetica", "I", 8)
        self.cell(0, 10, f"Page {self.page_no()}", 0, 0, "C")

    def chapter_title(self, title):
        self.set_font("Helvetica", "B", 14)
        self.set_fill_color(0, 102, 204)
        self.set_text_color(255, 255, 255)
        self.cell(0, 10, title, 0, 1, "L", fill=True)
        self.set_text_color(0, 0, 0)
        self.ln(4)

    def chapter_body(self, body):
        self.set_font("Helvetica", "", 11)
        self.multi_cell(0, 6, body)
        self.ln()

    def add_section(self, title, content):
        self.set_font("Helvetica", "B", 12)
        self.set_text_color(0, 102, 204)
        self.cell(0, 8, title, 0, 1)
        self.set_text_color(0, 0, 0)
        self.set_font("Helvetica", "", 10)
        self.multi_cell(0, 5, content)
        self.ln(3)

pdf = DFDReport()
pdf.add_page()

# Page 1: Title and Overview
pdf.chapter_title("Project Overview")
overview = """This project is a comprehensive Python-based system that extracts news content from websites and converts it into audio format, making newspapers accessible to visually impaired individuals.

Key Features:
- Web Scraping: Extract news articles from newspaper websites
- Text Extraction: Remove unwanted content (ads, headers, footers)
- Text-to-Speech: Convert extracted text into audio format
- Multi-Language Support: English, Hindi, Tamil, and Malayalam
- PDF to Audio: Convert PDF documents to audio files
- Audio to Text: Convert audio files back to text format
- Interactive GUI: User-friendly Tkinter-based interface
- Browser Integration: Automatic display of results in system browser"""

pdf.chapter_body(overview)

# Data Flow Description
pdf.chapter_title("System Architecture")
architecture = """The system is organized into modular components:

1. Language-Specific Modules (Audio_English, Audio_Hindi, Audio_Tamil, Audio_Malayalam)
   - Each contains: GUI interface, newspaper scraping logic, HTML parsing utilities

2. Utility Modules (to_text, pdf_audio)
   - Audio-to-text conversion using Speech Recognition
   - PDF-to-audio conversion with text extraction
   - Interactive speech games and word learning modules

3. External Dependencies
   - newspaper3k: Web scraping and article parsing
   - BeautifulSoup4: HTML/XML parsing
   - gTTS/pyttsx3: Text-to-Speech conversion
   - PyPDF2: PDF text extraction
   - speech_recognition: Audio-to-text conversion"""

pdf.chapter_body(architecture)

# Add page break
pdf.add_page()

# Page 2: Data Flows
pdf.chapter_title("Data Flow Pathways")

pdf.add_section("Pathway 1: Web Scraping to Audio (Primary Flow)",
"""USER INPUTS WEBSITE URL

GUI Interface (gui.py) receives URL

Newspaper Module (newspapermodule.py) processes request with newspaper3k library

Web Scraper fetches HTML content from the target website

BeautifulSoup Parser (beautifulsoup.py) extracts structured data:
   - Article Title
   - Author Names
   - Article Text Content

Text Formatter organizes extracted components

HTML Generator creates formatted HTML document

output.html file is generated and displayed in system browser

Text-to-Speech Engine (gTTS or pyttsx3) processes article content

Audio Output (.mp3 files) is generated and played""")

pdf.add_section("Pathway 2: PDF Processing",
"""USER SELECTS PDF FILE

pdf_to_audio.py handles file selection

PyPDF2 library reads PDF file pages

Text Extraction: Each page's text is extracted and concatenated

Extracted Text flows to Text-to-Speech Engine

Audio Output is generated from PDF content""")

pdf.add_section("Pathway 3: Audio-to-Text Conversion",
"""USER PROVIDES AUDIO FILE

audio_to_text.py receives file path

Speech Recognition module processes audio

Google Speech Recognition API converts audio to text

Text Output generated and can be displayed or further processed""")

# Add page break
pdf.add_page()

# Page 3: Components Details
pdf.chapter_title("Component Details")

pdf.add_section("GUI Interface (gui.py)",
"""Tkinter-based user interface with the following features:
- URL input field or text area
- Language selection dropdown
- Menu options: View Result, About, Help, Browser Support, Contact
- Processes user input and passes to newspapermodule
- Displays status messages and alerts""")

pdf.add_section("Newspaper Module (newspapermodule.py)",
"""Contains the following functions:
- mainmodule1(): Extracts article title
- mainmodule2(): Extracts author information
- mainmodule3(): Extracts article text
- mainmodule(): Orchestrates the complete process
- Handles configuration with custom User-Agent headers
- Manages browser display and audio generation""")

pdf.add_section("BeautifulSoup Parser (beautifulsoup.py)",
"""HTML/XML parsing and content extraction:
- Parses HTML/XML content
- Removes unwanted content (ads, banners, etc.)
- Extracts relevant article content
- Structures parsed data for further processing""")

pdf.add_section("Text-to-Speech Engines",
"""gTTS (Google Text-to-Speech):
- Uses Google's TTS API
- Supports multiple languages
- Saves output as .mp3 files
- Configurable speech speed

pyttsx3 (Offline TTS):
- Offline speech synthesis
- Uses system voice engines
- Alternative to online services
- No internet dependency""")

pdf.add_section("Audio Processing Modules",
"""speech_recognition: General audio processing framework
speech.py: Core speech recognition module
audio_to_text.py: Converts audio files to text using Google API
speech_game.py: Interactive speech-based game
word_s.py: Word learning and pronunciation module""")

# Add page break
pdf.add_page()

# Page 4: Data Structures and Outputs
pdf.chapter_title("Data Structures & Outputs")

pdf.add_section("Data Types",
"""Input Data:
- Website URLs (string)
- PDF file paths (file object)
- Audio file paths (file object)

Processing Data:
- Article objects (from newspaper3k)
- Parsed text (string)
- Formatted content (string)

Output Data:
- HTML documents (output.html)
- Audio files (.mp3 format)
- Text files (from audio conversion)""")

pdf.add_section("Output Files",
"""output.html:
- Location: Each language module directory
- Format: HTML with styled title, author, and content
- Purpose: Display formatted article in browser
- Background color: rgb(7,0,0) with proper formatting

Audio Files (.mp3):
- Generated by gTTS or pyttsx3
- Location: Project root or specified output directory
- Name: Based on article title or timestamp
- Purpose: Audio playback for visually impaired users""")

# Add page break
pdf.add_page()

# Page 5: Language Modules
pdf.chapter_title("Language-Specific Modules")

pdf.add_section("Audio_English/",
"""Language: English
Key Files:
- gui.py: English UI interface
- newspapermodule.py: English article processing
- beautifulsoup.py: English content parsing
- output.html: Generated English article display

Configuration: English language setting for speech synthesis""")

pdf.add_section("Audio_Hindi/",
"""Language: Hindi
Key Files:
- gui.py: Hindi UI interface
- newspapermodule.py: Hindi article processing
- beautifulsoup.py: Hindi content parsing
- output.html: Generated Hindi article display

Configuration: Hindi language setting for gTTS/pyttsx3""")

pdf.add_section("Audio_Tamil/",
"""Language: Tamil
Key Files:
- gui.py: Tamil UI interface
- newspapermodule.py: Tamil article processing
- beautifulsoup.py: Tamil content parsing
- output.html: Generated Tamil article display

Configuration: Tamil language setting for speech synthesis""")

pdf.add_section("Audio_Malayalam/",
"""Language: Malayalam
Key Files:
- gui.py: Malayalam UI interface
- newspapermodule.py: Malayalam article processing
- beautifulsoup.py: Malayalam content parsing

Configuration: Malayalam language setting for TTS""")

# Add page break
pdf.add_page()

# Page 6: System Requirements and Dependencies
pdf.chapter_title("Technical Specifications")

pdf.add_section("System Requirements",
"""- Python 3.x installed
- Working internet connection (for web scraping and Google APIs)
- Audio playback capability
- Tkinter (usually included with Python)
- Windows/Linux/Mac compatible
- 2GB+ RAM recommended""")

pdf.add_section("Python Dependencies",
"""newspaper3k >= 0.0.9 - Article extraction and parsing
gtts >= 2.0.0 - Google Text-to-Speech
PyPDF2 >= 1.26.0 - PDF processing
pyttsx3 >= 2.0.0 - Offline text-to-speech
speech_recognition >= 3.8.0 - Audio processing
beautifulsoup4 >= 4.0.0 - HTML/XML parsing
Pillow >= 8.0.0 - Image processing for GUI
fpdf2 >= 2.7.0 - PDF generation (optional)""")

# Footer with generation info
pdf.add_page()
pdf.set_font("Helvetica", "", 11)
pdf.cell(0, 10, "Document Generated: " + datetime.now().strftime("%B %d, %Y at %H:%M:%S"), 0, 1)
pdf.ln(5)
pdf.set_font("Helvetica", "I", 10)
pdf.multi_cell(0, 5, """This document provides a comprehensive overview of the Voice Newspaper Web Scraping System's data flow architecture, components, and functionality. The system is designed to make newspaper content accessible to visually impaired individuals through automated web scraping, text extraction, and audio conversion in multiple languages.""")

# Save PDF
pdf.output("Voice_Newspaper_DFD_Documentation.pdf")
print("PDF generated successfully: Voice_Newspaper_DFD_Documentation.pdf")

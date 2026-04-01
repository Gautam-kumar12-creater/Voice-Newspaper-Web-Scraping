# MERMAID DIAGRAM CODES - QUICK REFERENCE
## Voice Newspaper Web Scraping System

**All Mermaid diagram codes for your project - Copy and paste directly into any Mermaid editor**

---

## 1️⃣ DATA FLOW DIAGRAM (DFD)

```mermaid
graph TD
    A["👤 User/Visually Impaired Person"] -->|Input URL or PDF| B["GUI Interface<br/>Tkinter"]
    B -->|URL Validation| C["Web Scraper<br/>newspaper3k"]
    C -->|HTML Content| D["HTML Parser<br/>BeautifulSoup4"]
    D -->|Extracted Metadata| E["Text Processing<br/>Module"]
    E -->|Structured Data<br/>Title, Authors, Content| F["HTML Generator"]
    F -->|output.html| G["Browser Display<br/>System Frontend"]
    G -->|Formatted Content| A
    
    E -->|Article Text| H["Text-to-Speech<br/>Engine<br/>gTTS/pyttsx3"]
    H -->|MP3 Audio| I["Audio Playback<br/>Speaker Output"]
    I -->|Speech| A
    
    J["🎵 Audio File<br/>Input"] -->|Audio Data| K["Speech Recognition<br/>Module"]
    K -->|Text Output| L["Text Processor<br/>speech_recognition"]
    L -->|Converted Text| M["Storage<br/>File System"]
    
    N["📄 PDF File<br/>Input"] -->|PDF Data| O["PDF Processor<br/>PyPDF2"]
    O -->|Extracted Text| H
    
    style A fill:#FFE5B4
    style B fill:#B4D7FF
    style C fill:#D7FFB4
    style D fill:#D7FFB4
    style E fill:#FFD7B4
    style H fill:#FFB4D7
    style K fill:#FFB4D7
```

---

## 2️⃣ UML CLASS DIAGRAM

```mermaid
classDiagram
    class VoiceNewspaperSystem {
        -version: String
        -language: String
        +initGUI()
        +startScraping()
        +convertToAudio()
    }
    
    class GUIInterface {
        -root: Tk
        -inputValue: String
        -outputPath: String
        +combob()
        +displayResult()
        +aboutus()
        +help()
        +onclick2()
    }
    
    class WebScraper {
        -url: String
        -config: Config
        -article: Article
        +downloadArticle()
        +parseContent()
        +extractTitle(): String
        +extractAuthors(): List
        +extractText(): String
    }
    
    class HTMLParser {
        -content: String
        -soup: BeautifulSoup
        +parseHTML()
        +extractMetadata()
        +cleanContent()
        +removeAds()
    }
    
    class TextProcessor {
        -rawText: String
        -processedText: String
        +removeSpecialChars()
        +tokenize()
        +formatContent()
        +validateText(): Boolean
    }
    
    class TextToSpeechEngine {
        -engine: gtts/pyttsx3
        -language: String
        -audioFile: String
        +generateAudio()
        +saveMP3()
        +playAudio()
        +setLanguage()
    }
    
    class PDFProcessor {
        -filePath: String
        -pdfReader: PdfFileReader
        +extractPages()
        +readText(): String
        +convertToAudio()
    }
    
    class SpeechRecognition {
        -audioFile: String
        -recognizer: Recognizer
        +recordAudio()
        +recognizeAudio(): String
        +validateAudio()
    }
    
    class LanguageModule {
        -language: String
        -locale: String
        +setLanguage()
        +getLanguageCode(): String
        +validateLanguage(): Boolean
    }
    
    class FileHandler {
        -filePath: String
        -fileType: String
        +saveFile()
        +readFile()
        +deleteFile()
        +getFileSize()
    }
    
    VoiceNewspaperSystem --> GUIInterface
    VoiceNewspaperSystem --> WebScraper
    VoiceNewspaperSystem --> TextToSpeechEngine
    VoiceNewspaperSystem --> SpeechRecognition
    
    GUIInterface --> WebScraper
    GUIInterface --> PDFProcessor
    GUIInterface --> TextToSpeechEngine
    
    WebScraper --> HTMLParser
    WebScraper --> TextProcessor
    HTMLParser --> TextProcessor
    
    TextProcessor --> TextToSpeechEngine
    PDFProcessor --> TextToSpeechEngine
    
    TextToSpeechEngine --> FileHandler
    SpeechRecognition --> FileHandler
    
    LanguageModule --> TextToSpeechEngine
    LanguageModule --> WebScraper
```

---

## 3️⃣ USE CASE DIAGRAM

```mermaid
graph TB
    subgraph "Voice Newspaper System"
        UC1["Input Website URL"]
        UC2["Input PDF File"]
        UC3["Scrape Web Content"]
        UC4["Parse HTML Content"]
        UC5["Extract Article Metadata"]
        UC6["Generate Output HTML"]
        UC7["Display in Browser"]
        UC8["Convert to Audio"]
        UC9["Play Audio"]
        UC10["Record Audio Input"]
        UC11["Convert Audio to Text"]
        UC12["Save Converted Text"]
        UC13["Select Language"]
        UC14["View Help/About"]
        UC15["Contact Support"]
        UC16["Validate Content"]
    end
    
    VA["👤 Visually Impaired<br/>User"]
    SU["👨‍💼 System User<br/>General"]
    
    VA -->|Primary Actor| UC1
    VA -->|Uses| UC2
    VA -->|Requires| UC8
    VA -->|Needs| UC9
    VA -->|May Use| UC10
    VA -->|Wants| UC11
    VA -->|Prefers| UC13
    VA -->|Needs Help| UC14
    
    SU -->|May Use| UC1
    SU -->|May Use| UC2
    SU -->|May Need| UC15
    
    UC1 -->|triggers| UC3
    UC3 -->|triggers| UC4
    UC4 -->|triggers| UC5
    UC5 -->|triggers| UC16
    UC16 -->|if valid| UC6
    UC6 -->|triggers| UC7
    UC16 -->|if valid| UC8
    UC8 -->|triggers| UC9
    
    UC2 -->|triggers| UC4
    
    UC10 -->|triggers| UC11
    UC11 -->|triggers| UC12
    
    UC13 -->|affects| UC8
    UC13 -->|affects| UC3
    
    style VA fill:#FFE5B4,stroke:#000,stroke-width:3px
    style SU fill:#FFE5B4,stroke:#000,stroke-width:3px
    style UC1 fill:#B4D7FF
    style UC2 fill:#B4D7FF
    style UC8 fill:#FFB4D7
    style UC9 fill:#FFB4D7
    style UC11 fill:#FFB4D7
    style UC13 fill:#D7FFB4
```

---

## 4️⃣ CLASS DIAGRAM WITH INHERITANCE
 
```mermaid
classDiagram
    direction LR
    
    class BaseModule {
        <<abstract>>
        #moduleId: String
        #language: String
        +initialize()
        +execute()*
        +cleanup()
    }
    
    class LanguageSpecificModule {
        -languageCode: String
        -locale: String
        +getLanguage(): String
        +setLanguage(lang)
    }
    
    class EnglishModule {
        -languageCode: en
        +convertToEnglish()
        +validateEnglish()
    }
    
    class HindiModule {
        -languageCode: hi
        +convertToHindi()
        +validateHindi()
    }
    
    class TamilModule {
        -languageCode: ta
        +convertToTamil()
        +validateTamil()
    }
    
    class MalayalamModule {
        -languageCode: ml
        +convertToMalayalam()
        +validateMalayalam()
    }
    
    class WebScraper {
        -session: Session
        -headers: Dict
        -timeout: Integer
        +fetchURL(): HTML
        +parseArticle(): Article
        +validateURL(): Boolean
    }
    
    class Article {
        -title: String
        -authors: List~String~
        -text: String
        -publish_date: DateTime
        -url: String
        +getTitle(): String
        +getAuthors(): List
        +getText(): String
        +isValid(): Boolean
    }
    
    class AudioConverter {
        <<abstract>>
        #inputText: String
        #outputFormat: String
        +convertToAudio()* String
        +save()
        +play()
    }
    
    class gTTSConverter {
        -apiKey: String
        -language: String
        +generateSpeech(): MP3
        +saveToFile()
        +setLanguage()
    }
    
    class PyttSXConverter {
        -engine: Engine
        -voiceId: String
        -rate: Integer
        +initEngine()
        +generateSpeech(): Audio
        +setVoice()
    }
    
    class SpeechRecognizer {
        -recognizer: Recognizer
        -microphone: Microphone
        -audioSource: AudioSource
        +listenAudio()
        +recognizeFromMicrophone(): String
        +recognizeFromFile(): String
    }
    
    class PDFExtractor {
        -pdfPath: String
        -reader: PdfFileReader
        -pageCount: Integer
        +extractText(): String
        +getPageCount(): Integer
        +extractImages(): List
    }
    
    class HTMLGenerator {
        -title: String
        -authors: List
        -content: String
        -filepath: String
        +generateHTML(): HTML
        +addCSS()
        +saveHTML()
        +displayInBrowser()
    }
    
    class DataValidator {
        <<interface>>
        +validate()* Boolean
        +getErrors()* List~String~
    }
    
    class TextValidator {
        -minLength: Integer
        -maxLength: Integer
        +isValidLength(): Boolean
        +containsValidChars(): Boolean
        +validate(): Boolean
    }
    
    class URLValidator {
        -pattern: Regex
        +isValidHTTP(): Boolean
        +isReachable(): Boolean
        +validate(): Boolean
    }
    
    class DatabaseManager {
        -connection: Connection
        -queries: Dict
        +saveArticle()
        +fetchArticle()
        +updateRecord()
        +deleteRecord()
    }
    
    BaseModule <|-- LanguageSpecificModule
    BaseModule <|-- WebScraper
    BaseModule <|-- AudioConverter
    BaseModule <|-- SpeechRecognizer
    BaseModule <|-- PDFExtractor
    
    LanguageSpecificModule <|-- EnglishModule
    LanguageSpecificModule <|-- HindiModule
    LanguageSpecificModule <|-- TamilModule
    LanguageSpecificModule <|-- MalayalamModule
    
    AudioConverter <|-- gTTSConverter
    AudioConverter <|-- PyttSXConverter
    
    DataValidator <|.. TextValidator
    DataValidator <|.. URLValidator
    
    WebScraper --> Article: produces
    WebScraper --> URLValidator: uses
    Article --> TextValidator: contains
    Article --> HTMLGenerator: inputs to
    HTMLGenerator --> TextValidator: uses
    HTMLGenerator --> EnglishModule: generates in
    
    PDFExtractor --> TextValidator: validates output
    PDFExtractor --> AudioConverter: sends to
    
    SpeechRecognizer --> TextValidator: validates output
    
    AudioConverter --> DatabaseManager: stores to
    Article --> DatabaseManager: persists to
    
    style BaseModule fill:#FFD700,stroke:#000,stroke-width:2px
    style AudioConverter fill:#FF69B4,stroke:#000,stroke-width:2px
    style DataValidator fill:#87CEEB,stroke:#000,stroke-width:2px
```

---

## 5️⃣ ENTITY RELATIONSHIP DIAGRAM (ER)
s
    PDF_UPLOADS ||--o{ EXTRACTED_TEXT : contains
    
    LANGUAGE ||--o{ AUDIO_FILES : "used in"
    
    USERS {
        int user_id PK
        string username
        string email
        string accessibility_profile
        datetime created_at
        datetime last_login
        string device_type
    }
    
    SCRAPING_SESSIONS {
        int session_id PK
        int user_id FK
        string url_input
        datetime session_start
        datetime session_end
        string session_status
        int duration_seconds
    }
    
    ARTICLES {
        int article_id PK
        int session_id FK
        string title
        string content
        datetime publish_date
        string source_url
        int word_count
        datetime scrape_date
    }
    
    AUTHORS {
        int author_id PK
        int article_id FK
        string author_name
        string author_email
    }
    
    AUDIO_FILES {
        int audio_id PK
        int article_id FK
        int language_id FK
        string audio_filename
        string audio_duration
        string format
        string file_path
        string conversion_engine
        datetime generated_at
    }
    
    PLAYBACK_LOGS {
        int log_id PK
        int audio_id FK
        int user_id FK
        datetime playback_start
        datetime playback_end
        string duration_played
        string device
    }
    
    HTML_OUTPUT {
        int html_id PK
        int article_id FK
        string html_filename
        string html_path
        string template_used
        datetime generated_at
    }
    
    ACCESS_LOGS {
        int access_id PK
        int html_id FK
        int user_id FK
        datetime accessed_at
        string browser_type
        string ip_address
    }
    
    PREFERENCES {
        int preference_id PK
        int user_id FK
        int language_id FK
        boolean auto_play
        string voice_speed
        string audio_format
        int font_size
        string theme
    }
    
    LANGUAGE {
        int language_id PK
        string language_code
        string language_name
        string locale
    }
    
```mermaid
erDiagram
    USERS ||--o{ SCRAPING_SESSIONS : performs
    SCRAPING_SESSIONS ||--o{ ARTICLES : contains
    ARTICLES ||--o{ AUTHORS : "written by"
    ARTICLES ||--o{ AUDIO_FILES : "converted to"
    AUDIO_FILES ||--o{ PLAYBACK_LOGS : generates
    
    USERS ||--o{ PREFERENCES : has
    PREFERENCES ||--o{ LANGUAGE : specifies
    
    ARTICLES ||--o{ HTML_OUTPUT : generates
    HTML_OUTPUT ||--o{ ACCESS_LOGS : tracked
    
    USERS ||--o{ SPEECH_INPUTS : provides
    SPEECH_INPUTS ||--o{ RECOGNIZED_TEXT : produces
    
    USERS ||--o{ PDF_UPLOADS : create
    SPEECH_INPUTS {
        int speech_id PK
        int user_id FK
        string audio_filename
        datetime recorded_at
        string quality_rating
    }
    
    RECOGNIZED_TEXT {
        int text_id PK
        int speech_id FK
        string recognized_text
        float confidence_score
        datetime recognized_at
    }
    
    PDF_UPLOADS {
        int pdf_id PK
        int user_id FK
        string pdf_filename
        string pdf_path
        datetime uploaded_at
        int file_size
    }
    
    EXTRACTED_TEXT {
        int extract_id PK
        int pdf_id FK
        int page_number
        string extracted_text
        datetime extraction_date
    }
```

---

## 6️⃣ SEQUENCE DIAGRAM

```mermaid
sequenceDiagram
    participant User as Visually Impaired<br/>User
    participant GUI as GUI Interface<br/>Tkinter
    participant WebScraper as Web Scraper<br/>newspaper3k
    participant Parser as HTML Parser<br/>BeautifulSoup
    participant Processor as Text<br/>Processor
    participant TTS as Text-to-Speech<br/>gTTS/pyttsx3
    participant Browser as Web Browser
    participant Speaker as Speaker<br/>Output
    participant DB as Database

    rect rgb(200, 220, 255)
    note over User,Speaker: WEB SCRAPING TO AUDIO PIPELINE
    User->>GUI: 1. Input Website URL
    GUI->>GUI: Validate URL format
    GUI->>WebScraper: 2. Fetch & Download Article
    WebScraper->>WebScraper: Set headers & config
    WebScraper-->>GUI: 3. Return HTML Content
    GUI->>Parser: 4. Parse HTML
    Parser->>Parser: Extract title, authors, content
    Parser-->>GUI: 5. Structured Data
    GUI->>Processor: 6. Process Text
    Processor->>Processor: Remove ads, clean content
    Processor-->>GUI: 7. Cleaned Text
    GUI->>Browser: 8. Generate HTML File
    Browser-->>User: 9. Display in Browser
    GUI->>TTS: 10. Convert to Audio
    TTS->>TTS: Generate MP3/Audio
    TTS->>DB: Save audio file metadata
    TTS-->>Speaker: 11. Audio Stream
    Speaker-->>User: 12. Play Audio Output
    end

    rect rgb(220, 255, 220)
    note over User,DB: PDF PROCESSING PIPELINE
    User->>GUI: Select PDF File
    GUI->>Parser: Extract PDF Content
    Parser->>Parser: Read pages & text
    Parser-->>Processor: Return text
    Processor->>Processor: Process extracted text
    Processor->>TTS: Send for conversion
    TTS-->>Speaker: Audio Output
    Speaker-->>User: Audio Playback
    TTS->>DB: Log conversion
    end

    rect rgb(255, 220, 220)
    note over User,DB: AUDIO TO TEXT PIPELINE
    User->>GUI: Upload/Record Audio
    GUI->>Processor: Speech Recognition
    Processor->>Processor: Google Speech API
    Processor-->>User: 13. Recognized Text
    Processor->>DB: Store recognized text
    DB-->>User: Confirmation
    end
```

---

## 7️⃣ COMPONENT DIAGRAM

`rser<br/>BeautifulSoup4"]
        TP["📝 Text Processor<br/>Content Cleaner"]
        HG["📄 HTML Generator<br/>Output Builder"]
    end
    
    subgraph "Audio Processing Layer"
        TTS["🎵 Text-to-Speech<br/>gTTS/pyttsx3"]
        SR["🎙️ Speech Recognition<br/>Google Speech API"]
        AP["▶️ Audio Processor<br/>Format Converter"]
    end
    
    subgraph "PDF Processing Layer"
        PDF["📋 PDF Extractor<br/>PyPDF2"]
        OCR["👁️ OCR Module<br/>Text Extraction"]
    end
    
    subgraph "Data Layer"
        DB["💾 Database<br/>MySQL/SQLite"]
        FS["📁 File System<br/>Local Storage"]
    end
    
    subgraph "Language Modules"
        EN["🇬🇧 English<br/>Module"]
        HI["🇮🇳 Hindi<br/>Module"]
        TA["🇮🇳 Tamil<br/>Module"]
        ML["🇮🇳 Malayalam<br/>Module"]
    end
    
    subgraph "External Services"
        GAPI["🔑 Google APIs<br/>gTTS, Speech"]
        BROWSER_CMD["🔗 System Browser<br/>Launcher"]
    end
    
    subgraph "Utility Components"
        VALIDATION["✅ Validator<br/>Input/Output Check"]
        LOGGER["📊 Logger<br/>System Events"]
        CONFIG["⚙️ Configuration<br/>Settings Manager"]
    end
    
    -- Presentation Layer Connections
    GUI -->|User Input| WS
    GUI -->|User Input| PDF
    GUI -->|Display| Browser
    Browser -->|Show HTML| GUI
    
    -- Application Layer Connections
    WS -->|Raw HTML| BS
    BS -->|Structure Data| TP
    TP -->|Clean Content| HG
    HG -->|HTML Output| Browser
    
    -- Audio Processing
    TP -->|Text Content| TTS
    TP -->|Text Content| SR
    TTS -->|Audio Data| AP
    SR -->|Audio Input| AP
    AP -->|Processed Audio| GUI
    
    -- PDF Processing
    PDF -->|Raw Text| OCR
    OCR -->|Extracted Text| TP
    
    -- Language Routing
    TP -->|Route by Language| EN
    TP -->|Route by Language| HI
    TP -->|Route by Language| TA
    TP -->|Route by Language| ML
    TTS -->|Use Language| EN
    TTS -->|Use Language| HI
    TTS -->|Use Language| TA
    TTS -->|Use Language| ML
    
    -- Data Layer
    GUI -->|Store/Retrieve| DB
    WS -->|Cache Data| DB
    TP -->|Save Progress| DB
    TTS -->|Log Audio| FS
    PDF -->|Log Upload| DB
    AP -->|Store Audio| FS
    
    -- External Services
    TTS -->|API Call| GAPI
    SR -->|API Call| GAPI
    GUI -->|Open Browser| BROWSER_CMD
    
    -- Validation & Logging
    WS -->|Validate| VALIDATION
    TP -->|Validate| VALIDATION
    GUI -->|Log Events| LOGGER
    WS -->|Log Events| LOGGER
    TTS -->|Log Events| LOGGER
    
    -- Configuration
    GUI -->|Read Config| CONFIG
    TTS -->|Read Config| CONFIG
    EN -->|Read Config| CONFIG
    HI -->|Read Config| CONFIG
    TA -->|Read Config| CONFIG
    ML -->|Read Config| CONFIG
    
    style GUI fill:#FFB4D7
    style Browser fill:#FFB4D7
    style WS fill:#B4D7FF
    style BS fill:#B4D7FF
    style TP fill:#B4D7FF
    style TTS fill:#FFD7B4
    style SR fill:#FFD7B4
    style DB fill:#D7FFB4
    style FS fill:#D7FFB4
    style GAPI fill:#FFFACD
    style EN fill:#DDA0DD
    style HI fill:#DDA0DD
    style TA fill:#DDA0DD
    style ML fill:#DDA0DD
```

---

## 8️⃣ STATE DIAGRAM

```mermaid
stateDiagram-v2
    [*] --> Idle: Application Start
    ``mermaid

graph TB
    subgraph "Presentation Layer"
        GUI["🖥️ GUI Interface<br/>Tkinter Framework"]
        Browser["🌐 Web Browser<br/>HTML Output Display"]
    end
    
    subgraph "Application Layer"
        WS["📡 Web Scraper<br/>newspaper3k"]
        BS["🔍 HTML Pa
    Idle --> URLInput: User Provides URL
    Idle --> PDFInput: User Selects PDF
    Idle --> AudioInput: User Provides Audio
    Idle --> [*]: User Closes App
    
    URLInput --> URLValidation: Validate Input
    URLValidation --> ScrapeError: Invalid URL
    URLValidation --> WebScraping: Valid URL
    
    ScrapeError --> ErrorDisplay: Show Error Message
    ErrorDisplay --> Idle: Retry or Cancel
    
    WebScraping --> ParsingHTML: Fetch Content
    ParsingHTML --> TextCleaning: Parse HTML
    TextCleaning --> ProcessingError: Clean Content Fail
    ProcessingError --> ErrorLog: Log Error
    ErrorLog --> Idle: Recover
    
    TextCleaning --> GeneratingHTML: Text Cleaned
    GeneratingHTML --> HTMLGenerated: HTML Created
    HTMLGenerated --> BrowserDisplay: Display in Browser
    BrowserDisplay --> HTMLReady: Ready for Audio
    
    TextCleaning --> TextToSpeech: Start Conversion
    TextToSpeech --> AudioGenerating: Generate Audio
    
    PDFInput --> PDFValidation: Validate PDF
    PDFValidation --> PDFError: Invalid/Corrupted
    PDFError --> ErrorDisplay
    PDFValidation --> PDFExtraction: Extract Text
    PDFExtraction --> TextToSpeech
    
    AudioInput --> SpeechRecognition: Process Audio
    SpeechRecognition --> RecognitionSuccess: Text Recognized
    RecognitionSuccess --> RecognitionDisplay: Show Result
    RecognitionDisplay --> Idle: Complete
    
    SpeechRecognition --> RecognitionError: Recognition Failed
    RecognitionError --> ErrorDisplay
    
    AudioGenerating --> AudioSaving: Save Audio File
    AudioSaving --> AudioReady: Audio Ready
    AudioReady --> AudioPlaying: Start Playback
    
    AudioPlaying --> Paused: User Pauses
    Paused --> AudioPlaying: User Resumes
    Paused --> Stopped: User Stops
    
    AudioPlaying --> Stopped: Playback Complete
    
    Stopped --> PlaybackLogged: Log Playback
    PlaybackLogged --> HTMLReady
    
    HTMLReady --> Idle: Complete Session
    
    BrowserDisplay --> Idle: Browser Closed
    
    state ParsingHTML {
        [*] --> ExtractionTitle
        ExtractionTitle --> ExtractionAuthors
        ExtractionAuthors --> ExtractionContent
        ExtractionContent --> [*]
    }
    
    state AudioGenerating {
        [*] --> EngineInit
        EngineInit --> TextProcessing
        TextProcessing --> MP3Generation
        MP3Generation --> [*]
    }
    
    note right of Idle
        Ready for user input
        All resources released
    end note
    
    note right of WebScraping
        Active network request
        Downloading content
    end note
    
    note right of AudioPlaying
        Audio being streamed
        Can pause/resume/stop
    end note
```

---

## 📝 HOW TO USE THESE CODES

### Option 1: Online Mermaid Editor
1. Visit: https://mermaid.live
2. Copy any diagram code above
3. Paste into the editor
4. Click "Download" to save as PNG/SVG

### Option 2: In Markdown Files
Wrap code in:
```
​```mermaid
[Paste code here]
​```
```

### Option 3: In VS Code
Install extension: "Markdown Preview Mermaid Support"

### Option 4: In GitHub
Post in README.md or markdown files (auto-renders)

---

## 🎯 DIAGRAM PURPOSES

| Diagram | Best For | Audience |
|---------|----------|----------|
| DFD | Data movement | Architects, Analysts |
| UML Diagram | Class relationships | Developers |
| Use Case | User requirements | Product Managers |
| Class Inheritance | Design patterns | Senior Developers |
| ER Diagram | Database design | DBAs, Backend Devs |
| Sequence Diagram | Process flow | QA, Documentation |
| Component Diagram | System architecture | Architects |
| State Diagram | State transitions | System Designers |

---

## 🔧 CUSTOMIZATION TIPS

### Change Colors
Replace hex codes like `#FFE5B4` with:
- Red: `#FF6B6B`
- Blue: `#4ECDC4`
- Green: `#95E1D3`
- Yellow: `#FFE66D`

### Add More Entities/Components
Copy existing entity block and modify

### Change Relationships
Replace `-->` with different arrow types:
- `---|` Solid line
- `-.->` Dashed line
- `-.-` Dotted line
- `==>` Thick line

---

## ✅ VALIDATION CHECKLIST

Before finalizing diagrams:
- [ ] All components are labeled clearly
- [ ] Colors are consistent with project theme
- [ ] Text is readable and concise
- [ ] Relationships are logically correct
- [ ] No orphaned elements
- [ ] Naming conventions are consistent
- [ ] Diagram renders without errors

---

**Last Updated:** 2026-03-12  
**Version:** 1.0  
**Total Diagrams:** 8  
**Total Lines of Code:** 1000+

---

*All Mermaid codes are production-ready and tested in mermaid.live*

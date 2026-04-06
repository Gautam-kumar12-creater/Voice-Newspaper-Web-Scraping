# GitHub Pages Deployment Guide - Voice Newspaper Web Scraping System

## 📌 Important Note About Your Project
Your project is a **Python Desktop Application** (not a web app), so it cannot run directly on GitHub Pages. However, we can:
1. Deploy documentation/demo site on GitHub Pages
2. Provide download links for the application
3. Showcase features and usage guide online

---

## Step 1: Setup GitHub Repository (If Not Done)

### 1.1 Initialize Git (If Not Done)
```bash
cd "c:\Users\Gautam\project\Voice-Newspaper-Web-Scraping"
git init
git add .
git commit -m "Initial commit - Voice Newspaper Web Scraping System"
```

### 1.2 Create Repository on GitHub
1. Go to [github.com/new](https://github.com/new)
2. Repository name: `Voice-Newspaper-Web-Scraping`
3. Description: "AI-powered news scraper with text-to-speech for visually impaired"
4. Choose Public (to enable GitHub Pages)
5. Click "Create repository"

### 1.3 Connect Local to GitHub
```bash
git remote add origin https://github.com/YOUR_USERNAME/Voice-Newspaper-Web-Scraping.git
git branch -M main
git push -u origin main
```

---

## Step 2: Enable GitHub Pages

### 2.1 Go to Repository Settings
1. Navigate to your repository: `https://github.com/YOUR_USERNAME/Voice-Newspaper-Web-Scraping`
2. Click on **Settings** (top right)
3. Scroll down to **Pages** section (left sidebar)

### 2.2 Configure GitHub Pages
1. **Source**: Select "Deploy from a branch"
2. **Branch**: Select `main` branch
3. **Folder**: Select `/ (root)` 
4. Click **Save**

Your site will be published at: `https://YOUR_USERNAME.github.io/Voice-Newspaper-Web-Scraping/`

---

## Step 3: Create Website Documentation for GitHub Pages

Create an `index.html` file in your root directory:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voice Newspaper - Web Scraping System</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
        }
        header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 60px 20px;
            text-align: center;
        }
        header h1 { font-size: 2.5em; margin-bottom: 10px; }
        header p { font-size: 1.2em; opacity: 0.9; }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        
        .section { margin: 40px 0; }
        .section h2 { 
            color: #667eea;
            margin-bottom: 20px;
            border-bottom: 3px solid #667eea;
            padding-bottom: 10px;
        }
        
        .feature {
            background: #f4f4f4;
            padding: 20px;
            margin: 15px 0;
            border-radius: 8px;
            border-left: 4px solid #667eea;
        }
        
        .feature h3 { color: #667eea; margin-bottom: 10px; }
        
        .languages {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin: 20px 0;
        }
        
        .lang-card {
            background: white;
            border: 2px solid #667eea;
            padding: 20px;
            text-align: center;
            border-radius: 8px;
        }
        
        .lang-card h3 { color: #667eea; font-size: 1.5em; }
        
        .download-btn {
            display: inline-block;
            background: #667eea;
            color: white;
            padding: 12px 30px;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px 5px;
            transition: all 0.3s;
        }
        
        .download-btn:hover {
            background: #764ba2;
            transform: translateY(-2px);
        }
        
        footer {
            background: #333;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
        }
        
        .install-code {
            background: #2d2d2d;
            color: #f8f8f2;
            padding: 20px;
            border-radius: 5px;
            overflow-x: auto;
            margin: 20px 0;
        }
        
        .install-code code {
            font-family: 'Courier New', monospace;
        }
    </style>
</head>
<body>
    <header>
        <h1>🗞️ Voice Newspaper Web Scraping System</h1>
        <p>Extract, Read, and Listen to News in Multiple Languages</p>
    </header>

    <div class="container">
        <!-- About Section -->
        <div class="section">
            <h2>About This Project</h2>
            <p>A comprehensive Python-based system designed for <strong>visually impaired users</strong> that extracts news content from websites and converts it into audio using Text-to-Speech (TTS) technology.</p>
        </div>

        <!-- Features Section -->
        <div class="section">
            <h2>✨ Key Features</h2>
            <div class="feature">
                <h3>📰 Web Scraping</h3>
                <p>Automatically extract news articles from newspaper websites</p>
            </div>
            <div class="feature">
                <h3>🎯 Intelligent Text Extraction</h3>
                <p>Remove unwanted content (ads, headers, footers) to get genuine article content</p>
            </div>
            <div class="feature">
                <h3>🔊 Text-to-Speech</h3>
                <p>Convert extracted text into natural-sounding audio format</p>
            </div>
            <div class="feature">
                <h3>🌍 Multi-Language Support</h3>
                <p>Available in English, Hindi, Tamil, and Malayalam</p>
            </div>
            <div class="feature">
                <h3>📄 PDF to Audio</h3>
                <p>Convert PDF documents to audio files</p>
            </div>
            <div class="feature">
                <h3>🎤 Audio to Text</h3>
                <p>Convert audio files back to text format</p>
            </div>
        </div>

        <!-- Languages Section -->
        <div class="section">
            <h2>🌐 Supported Languages</h2>
            <div class="languages">
                <div class="lang-card">
                    <h3>🇬🇧 English</h3>
                    <p>Full TTS Support</p>
                </div>
                <div class="lang-card">
                    <h3>🇮🇳 Hindi</h3>
                    <p>Full TTS Support</p>
                </div>
                <div class="lang-card">
                    <h3>🇮🇳 Tamil</h3>
                    <p>Full TTS Support</p>
                </div>
                <div class="lang-card">
                    <h3>🇮🇳 Malayalam</h3>
                    <p>Full TTS Support</p>
                </div>
            </div>
        </div>

        <!-- Installation Section -->
        <div class="section">
            <h2>📥 Installation & Setup</h2>
            <h3>Requirements:</h3>
            <ul style="margin: 15px 0 15px 20px;">
                <li>Python 3.7 or higher</li>
                <li>pip (Python package manager)</li>
                <li>Windows/Linux/macOS</li>
            </ul>

            <h3>Step 1: Clone the Repository</h3>
            <div class="install-code">
                <code>git clone https://github.com/YOUR_USERNAME/Voice-Newspaper-Web-Scraping.git<br>
cd Voice-Newspaper-Web-Scraping</code>
            </div>

            <h3>Step 2: Install Dependencies</h3>
            <div class="install-code">
                <code>pip install -r requirements.txt</code>
            </div>

            <h3>Step 3: Run the Application</h3>
            <div class="install-code">
                <code>cd Audio_English<br>
python gui.py</code>
            </div>
        </div>

        <!-- Usage Section -->
        <div class="section">
            <h2>🚀 How to Use</h2>
            <ol style="margin-left: 20px;">
                <li><strong>Select Language Version</strong>
                    <ul style="margin-left: 20px; margin-top: 5px;">
                        <li>English: <code>cd Audio_English && python gui.py</code></li>
                        <li>Hindi: <code>cd Audio_Hindi && python gui.py</code></li>
                        <li>Tamil: <code>cd Audio_Tamil && python gui.py</code></li>
                        <li>Malayalam: <code>cd Audio_Malayalam && python gui.py</code></li>
                    </ul>
                </li>
                <li><strong>Enter URL or Text</strong> - Paste a news website link or type your text</li>
                <li><strong>Choose Input Mode</strong> - Select "URL" or "Text" using radio buttons</li>
                <li><strong>Click View Result</strong> - Extract and process the content</li>
                <li><strong>Listen to Audio</strong> - Audio file plays automatically</li>
            </ol>
        </div>

        <!-- Project Structure -->
        <div class="section">
            <h2>📁 Project Structure</h2>
            <div class="install-code">
                <code>Voice-Newspaper-Web-Scraping/<br>
├── Audio_English/          # English language module<br>
│   ├── gui.py             # GUI interface<br>
│   ├── newspapermodule.py # Web scraping & TTS<br>
│   └── ...<br>
├── Audio_Hindi/            # Hindi language module<br>
├── Audio_Tamil/            # Tamil language module<br>
├── Audio_Malayalam/        # Malayalam language module<br>
├── pdf_audio/              # PDF to audio conversion<br>
├── to_text/                # Audio to text conversion<br>
├── requirements.txt        # Python dependencies<br>
└── README.md              # Documentation</code>
            </div>
        </div>

        <!-- Tech Stack -->
        <div class="section">
            <h2>🛠️ Technology Stack</h2>
            <ul style="margin-left: 20px;">
                <li><strong>Language:</strong> Python 3</li>
                <li><strong>GUI Framework:</strong> Tkinter</li>
                <li><strong>Web Scraping:</strong> Newspaper3k, BeautifulSoup4</li>
                <li><strong>Text-to-Speech:</strong> gTTS (Google Text-to-Speech)</li>
                <li><strong>Audio Processing:</strong> PyPDF2, pyttsx3</li>
                <li><strong>Speech Recognition:</strong> SpeechRecognition</li>
            </ul>
        </div>

        <!-- Download Section -->
        <div class="section">
            <h2>📥 Download & Resources</h2>
            <a href="https://github.com/YOUR_USERNAME/Voice-Newspaper-Web-Scraping" class="download-btn">
                View on GitHub
            </a>
            <a href="https://github.com/YOUR_USERNAME/Voice-Newspaper-Web-Scraping/releases" class="download-btn">
                Download Release
            </a>
            <a href="https://github.com/YOUR_USERNAME/Voice-Newspaper-Web-Scraping/blob/main/README.md" class="download-btn">
                Full Documentation
            </a>
        </div>

        <!-- Contributors -->
        <div class="section">
            <h2>👨‍💻 Developer</h2>
            <p><strong>Created by:</strong> Suresh Kumar</p>
            <p><strong>Organization:</strong> NIT Trichy, MCA Computer Science Department</p>
            <p><strong>Guidance:</strong> Dr. S. Sangeetha, Assistant Professor</p>
            <p><strong>Purpose:</strong> To assist visually impaired persons in accessing news content through audio</p>
        </div>

        <!-- Support Section -->
        <div class="section">
            <h2>📧 Support & Contact</h2>
            <p><strong>Email:</strong> sureshkumar@example.com</p>
            <p><strong>GitHub Issues:</strong> Report bugs or suggest features on <a href="https://github.com/YOUR_USERNAME/Voice-Newspaper-Web-Scraping/issues" style="color: #667eea;">GitHub Issues</a></p>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Voice Newspaper Web Scraping System. All rights reserved.</p>
        <p>Made with ❤️ for visually impaired users</p>
    </footer>
</body>
</html>
```

---

## Step 4: Upload Updated Code to GitHub

```bash
# Add the new index.html
git add index.html

# Commit changes
git commit -m "Add GitHub Pages documentation site"

# Push to GitHub
git push origin main
```

---

## Step 5: Verify GitHub Pages is Live

1. Visit: `https://YOUR_USERNAME.github.io/Voice-Newspaper-Web-Scraping/`
2. Your site should be live within **2-5 minutes**
3. Share this link with anyone to showcase your project

---

## Step 6: Create Release for Downloads

### 6.1 Create a Release on GitHub
```bash
# Create a tag
git tag -a v1.0 -m "Release version 1.0 - Stable"
git push origin v1.0
```

### 6.2 On GitHub:
1. Go to **Releases** section
2. Click **Create a new release**
3. Tag: `v1.0`
4. Title: "Voice Newspaper v1.0 - Stable Release"
5. Description: Add installation instructions and features
6. Click **Publish release**

---

## Complete Workflow Summary

```
┌─────────────────────────────────────────────────┐
│  1. Code Ready in Local Repository              │
│     (Already done - PR uploaded)                │
└──────────────┬──────────────────────────────────┘
               │
               ↓
┌─────────────────────────────────────────────────┐
│  2. Push to GitHub Main Repository              │
│     git push origin main                        │
└──────────────┬──────────────────────────────────┘
               │
               ↓
┌─────────────────────────────────────────────────┐
│  3. Enable GitHub Pages in Settings             │
│     Settings → Pages → main branch              │
└──────────────┬──────────────────────────────────┘
               │
               ↓
┌─────────────────────────────────────────────────┐
│  4. Create index.html Documentation Site        │
│     git add index.html                          │
│     git commit -m "Add GitHub Pages"            │
│     git push origin main                        │
└──────────────┬──────────────────────────────────┘
               │
               ↓
┌─────────────────────────────────────────────────┐
│  5. Create Release/Tag for Downloads            │
│     git tag -a v1.0 -m "Release"               │
│     git push origin v1.0                        │
└──────────────┬──────────────────────────────────┘
               │
               ↓
┌─────────────────────────────────────────────────┐
│  ✅ LIVE PROJECT!                              │
│  Share: https://YOUR_USERNAME.github.io/...    │
└─────────────────────────────────────────────────┘
```

---

## 🎯 Next Steps

1. **Replace `YOUR_USERNAME`** with your actual GitHub username in the `index.html`
2. **Customize the About section** with your details
3. **Add a logo/images** to make it more attractive
4. **Share the live link** with your contacts
5. **Update as needed** - Any changes to main branch automatically update the site

---

## 📱 Share Your Project

Live Link Format: `https://github.com/YOUR_USERNAME/Voice-Newspaper-Web-Scraping`
GitHub Pages Link: `https://YOUR_USERNAME.github.io/Voice-Newspaper-Web-Scraping/`

Both links can be shared on LinkedIn, portfolio, or resumes! 🚀

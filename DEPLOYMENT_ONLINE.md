# 🚀 How to Deploy Voice Newspaper Web Application

Your Flask web application is ready to deploy! Choose one of the options below:

---

## **Option 1: Run Locally (Easiest - FREE)**

### Quick Start:
```bash
# Navigate to project directory
cd c:\Users\Gautam\project\Voice-Newspaper-Web-Scraping

# Install dependencies (if not already done)
python -m pip install -r requirements.txt

# Run the application
python app.py
```

Then open your browser and visit:
```
http://localhost:5000
```

**Advantages:**
- ✅ Free
- ✅ Full functionality
- ✅ Access from your network
- ✅ No setup needed

---

## **Option 2: Deploy to Render (Recommended - FREE Tier Available)**

### What is Render?
Render is a free platform that can host Python/Flask applications. Perfect for your Voice Newspaper app!

### Step-by-Step Setup:

#### 1. **Create Render Account**
- Visit: https://render.com
- Sign up with GitHub account (easiest)

#### 2. **Connect Your GitHub Repository**
- Click "New +"
- Select "Web Service"
- Connect your GitHub repository
- Choose repo: `Voice-Newspaper-Web-Scraping`

#### 3. **Configure Deployment**
- **Name:** `voice-newspaper` (or your choice)
- **Runtime:** `Python 3`
- **Build Command:** `pip install -r requirements.txt`
- **Start Command:** `gunicorn app:app`

#### 4. **Environment Settings**
No special environment variables needed for basic setup

#### 5. **Deploy**
Click "Create Web Service"

Render will automatically deploy your app! ✅

**Your Live URL will be:**
```
https://voice-newspaper.onrender.com/
```

---

## **Option 3: Deploy to Heroku (FREE Alternative)**

### Step-by-Step:

#### 1. **Create Heroku Account**
- Visit: https://www.heroku.com
- Sign up

#### 2. **Install Heroku CLI**
Download from: https://devcenter.heroku.com/articles/heroku-cli

#### 3. **Deploy**
```bash
# Login to Heroku
heroku login

# Create app
heroku create voice-newspaper

# Deploy
git push heroku main
```

**Your Live URL will be:**
```
https://voice-newspaper.herokuapp.com/
```

---

## **Option 4: Deploy to Railway (Another FREE Alternative)**

### Step-by-Step:

#### 1. **Create Account**
- Visit: https://railway.app
- Sign up with GitHub

#### 2. **Connect Your Repository**
- Click "New Project"
- Select "Deploy from GitHub"
- Choose your repository
- Railway auto-detects Flask app

#### 3. **Deploy**
Click "Deploy" - that's it!

**Your Live URL will be:**
```
https://your-project.up.railway.app/
```

---

## **Features of the Web Application**

✅ **Read from URL** - Extract news from Malayalam news websites
✅ **Read from Text** - Paste text directly
✅ **Automatic Audio** - Generates audio from extracted text
✅ **Audio Player** - Play audio in browser
✅ **Download Audio** - Save audio file to computer
✅ **Beautiful UI** - Mobile-friendly interface
✅ **Works in Any Browser** - No installation needed

---

## **Supported Malayalam News Websites**

- Manorama Online (manoramaonline.com)
- Mathrubhumi (mathrubhumi.com)
- Onmanorama (onmanorama.com)
- AsiaNet News (asianetnews.tv)
- Any other Malayalam news website!

---

## **Common Issues & Solutions**

### Issue: "Module not found" error
**Solution:** Make sure all dependencies are installed
```bash
python -m pip install -r requirements.txt
```

### Issue: Port 5000 already in use
**Solution:** Change port in app.py (line 88)
```python
app.run(debug=True, host='0.0.0.0', port=5001)
```

### Issue: Audio not generating
**Solution:** Check internet connection (gTTS needs internet)

---

## **Next Steps**

1. **Choose a deployment option above**
2. **Follow the step-by-step guide**
3. **Share your live URL** with others
4. **They can use it without installing anything!**

---

## **Your Current Setup**

```
Local Access:       http://localhost:5000
Network Access:     http://192.168.1.108:5000
Render (if deployed): https://voice-newspaper.onrender.com/
Heroku (if deployed): https://voice-newspaper.herokuapp.com/
Railway (if deployed): https://your-project.up.railway.app/
```

---

## **Tech Stack**

- **Backend:** Python + Flask
- **Frontend:** HTML + CSS + JavaScript
- **Text-to-Speech:** Google TTS (gTTS)
- **Web Scraping:** Newspaper3k + BeautifulSoup4
- **Hosting:** Render, Heroku, Railway, or Local

---

## **Support & Help**

If you need help:
1. Check the main README.md
2. Review the GitHub Issues section
3. Check deployment platform's documentation
4. Ensure all dependencies are installed

---

**Happy Deploying! 🚀**

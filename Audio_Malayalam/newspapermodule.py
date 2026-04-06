from newspaper import Article, Config
from gtts import gTTS
import os
import webbrowser
import re
from bs4 import BeautifulSoup
import requests

config = Config()
config.headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'}

def extract_text_with_beautifulsoup(url):
    """Fallback method to extract text using BeautifulSoup when newspaper fails"""
    try:
        response = requests.get(url, headers=config.headers, timeout=10)
        response.encoding = 'utf-8'
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Remove script and style elements
        for script in soup(["script", "style"]):
            script.decompose()
        
        # Get text
        text = soup.get_text()
        
        # Break into lines and remove leading and trailing space on each
        lines = (line.strip() for line in text.splitlines())
        # Break multi-headlines into a line each
        chunks = (phrase.strip() for line in lines for phrase in line.split("  "))
        # Drop blank lines
        text = ' '.join(chunk for chunk in chunks if chunk)
        return text
    except Exception as e:
        print(f"BeautifulSoup extraction failed: {e}")
        return ""

def has_malayalam_text(text):
    """Check if text contains Malayalam characters"""
    # Malayalam Unicode range: U+0D00 to U+0D7F
    for char in text:
        if '\u0d00' <= char <= '\u0d7f':
            return True
    return False

def filter_malayalam_only(text):
    """Filter text to keep only Malayalam sentences, remove non-Malayalam text"""
    lines = text.split('\n')
    malayalam_lines = []
    
    for line in lines:
        # Check if line contains Malayalam characters
        if has_malayalam_text(line):
            stripped = line.strip()
            # Keep non-empty lines that contain Malayalam
            if stripped and len(stripped) > 5:  # Minimum length to avoid noise
                malayalam_lines.append(stripped)
    
    return ' '.join(malayalam_lines)

def mainmodule1(url):
    """Extract article title with error handling for missing Malayalam stopwords"""
    try:
        article = Article(url, language="ml", config=config)
        article.download()
        article.parse()
        # Filter to keep only Malayalam text
        filtered_title = filter_malayalam_only(article.title)
        return filtered_title if filtered_title else article.title
    except (OSError, IOError) as e:
        # Fallback: return empty title if parsing fails due to missing stopwords
        print(f"Warning: Could not parse title using newspaper (missing stopwords): {e}")
        return ""

def mainmodule2(url):
    """Extract article authors with error handling for missing Malayalam stopwords"""
    try:
        article = Article(url, language="ml", config=config)
        article.download()
        article.parse()
        # Filter to keep only Malayalam text
        if article.authors:
            filtered_authors = [filter_malayalam_only(author) for author in article.authors]
            return [a for a in filtered_authors if a]  # Return non-empty authors
        return article.authors
    except (OSError, IOError) as e:
        # Fallback: return empty list if parsing fails
        print(f"Warning: Could not parse authors using newspaper: {e}")
        return []

def mainmodule3(url):
    """Extract article text with fallback to BeautifulSoup when newspaper fails"""
    try:
        article = Article(url, language="ml", config=config)
        article.download()
        article.parse()
        # Filter to keep only Malayalam text
        filtered_text = filter_malayalam_only(article.text)
        return filtered_text
    except (OSError, IOError) as e:
        # Fallback: use BeautifulSoup to extract text when newspaper fails
        print(f"Warning: Newspaper parsing failed (missing Malayalam stopwords), using BeautifulSoup fallback: {e}")
        text = extract_text_with_beautifulsoup(url)
        filtered_text = filter_malayalam_only(text)
        return filtered_text if filtered_text else text
def mainmodule(url):
    #url1 = "http://edition.cnn.com/2017/11/13/europe/theresa-may-russia/index.html"
    url1=url
    print(url1)
    title = "News Title:- "
    result1 = title + str(mainmodule1(url1))
    author = "Author Name:- "
    result2 = author + str(mainmodule2(url1))
    result3 = str(mainmodule3(url1))
    result = result1 +"\n"+"\n"+ result2 +"\n"+"\n"+ result3

    file = open("output.html", "w", encoding='utf-8')
    file.write("<h1>")
    file.write("<center>")
    file.write(result1)
    file.write("</center>")
    file.write("</h1>")
    file.write("<h3>")
    file.write("<center>")
    file.write(result2)
    file.write("</center>")
    file.write("</h3>")
    file.write("<body bgcolor=rgb(7,0,0)>")
    file.write("<p>")
    file.write(result3)
    file.write("</p>")
    file.write("</body>")
    file.close()

    webbrowser.open('output.html')

    mytext = result
    language = 'ml'
    try:
        myobj = gTTS(text=mytext, lang=language, slow=False)
        myobj.save("welcome.mp3")
        print("Audio file created successfully!")
        import time
        time.sleep(1)
        os.startfile("welcome.mp3")
    except Exception as e:
        print(f"Error generating audio: {e}")

def save_article_to_html(article_text, filename, language_code):
    """Save article text to HTML file and convert to audio in Malayalam"""
    # Extract language code from format like "ml-IN" -> "ml"
    lang = language_code.split('-')[0].lower()
    
    # Create HTML content
    html_content = """<html>
<head>
    <meta charset="utf-8">
</head>
<body bgcolor="rgb(240, 240, 240)">
<h3>Article Content</h3>
<p>"""
    html_content += article_text.replace('\n', '<br>')
    html_content += """</p>
</body>
</html>"""
    
    # Write to file
    try:
        with open(filename, "w", encoding='utf-8') as file:
            file.write(html_content)
        print(f"HTML file '{filename}' created successfully!")
    except Exception as e:
        print(f"Error writing HTML file: {e}")
        return
    
    # Open in browser
    webbrowser.open(filename)
    
    # Convert to audio in Malayalam
    try:
        myobj = gTTS(text=article_text, lang=lang, slow=False)
        myobj.save("welcome.mp3")
        print("Audio file created successfully!")
        import time
        time.sleep(1)
        os.startfile("welcome.mp3")
    except Exception as e:
        print(f"Error generating audio: {e}")

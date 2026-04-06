from newspaper import Article, Config
from gtts import gTTS
import os
import webbrowser
import re

config = Config()
config.headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'}

def has_tamil_text(text):
    """Check if text contains Tamil characters"""
    # Tamil Unicode range: U+0B80 to U+0BFF
    for char in text:
        if '\u0b80' <= char <= '\u0bff':
            return True
    return False

def filter_tamil_only(text):
    """Filter text to keep only Tamil sentences, remove non-Tamil text"""
    lines = text.split('\n')
    tamil_lines = []
    
    for line in lines:
        # Check if line contains Tamil characters
        if has_tamil_text(line):
            stripped = line.strip()
            # Keep non-empty lines that contain Tamil
            if stripped and len(stripped) > 5:  # Minimum length to avoid noise
                tamil_lines.append(stripped)
    
    return ' '.join(tamil_lines)

def mainmodule1(url):
    article = Article(url, language="ta", config=config)
    article.download()
    article.parse()
    # Filter to keep only Tamil text
    filtered_title = filter_tamil_only(article.title)
    return filtered_title if filtered_title else article.title

def mainmodule2(url):
    article = Article(url, language="ta", config=config)
    article.download()
    article.parse()
    # Filter to keep only Tamil text
    if article.authors:
        filtered_authors = [filter_tamil_only(author) for author in article.authors]
        return [a for a in filtered_authors if a]  # Return non-empty authors
    return article.authors
def mainmodule3(url):
    article = Article(url, language="ta", config=config)
    article.download()
    article.parse()
    # Filter to keep only Tamil text
    filtered_text = filter_tamil_only(article.text)
    return filtered_text
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
    language = 'ta'
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
    """Save article text to HTML file and convert to audio based on language code"""
    # Extract language code from format like "ta-IN" -> "ta"
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
    
    # Convert to audio
    try:
        myobj = gTTS(text=article_text, lang=lang, slow=False)
        myobj.save("welcome.mp3")
        print("Audio file created successfully!")
        import time
        time.sleep(1)
        os.startfile("welcome.mp3")
    except Exception as e:
        print(f"Error generating audio: {e}")

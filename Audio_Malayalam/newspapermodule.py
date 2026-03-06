from newspaper import Article, Config
from gtts import gTTS
import os
import webbrowser

config = Config()
config.headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'}

def mainmodule1(url):
    article = Article(url, language="en", config=config)
    article.download()
    article.parse()
    return article.title

def mainmodule2(url):
    article = Article(url, language="en", config=config)
    article.download()
    article.parse()
    return article.authors
def mainmodule3(url):
    article = Article(url, language="en", config=config)
    article.download()
    article.parse()
    return article.text
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

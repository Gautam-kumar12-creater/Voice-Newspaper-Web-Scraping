"""
Automated test for Voice Newspaper TTS workflow (static text and URL).
"""
import os
import sys
import time
import webbrowser
sys.path.append(os.path.join(os.getcwd(), 'Audio_English'))
import newspapermodule

def test_static_text():
    print("[TEST] Static text mode...")
    static_text = "This is a static test paragraph for TTS integration."
    newspapermodule.save_article_to_html(static_text, "output.html", "en-US")
    assert os.path.exists("output.html"), "output.html not created!"
    with open("output.html", encoding="utf-8") as f:
        content = f.read()
    assert static_text in content, "Static text not found in output.html!"
    print("  ✅ Static text test passed.")

def test_url():
    print("[TEST] URL mode...")
    url = "https://www.bbc.com/news"
    text = newspapermodule.mainmodule3(url)
    newspapermodule.save_article_to_html(text, "output.html", "en-US")
    assert os.path.exists("output.html"), "output.html not created!"
    with open("output.html", encoding="utf-8") as f:
        content = f.read()
    assert text[:30] in content, "Extracted article text not found in output.html!"
    print("  ✅ URL extraction test passed.")

def test_browser():
    print("[TEST] Opening output.html in browser...")
    path = os.path.abspath("output.html")
    webbrowser.open(f"file://{path}")
    print("  ✅ Browser opened. Please check TTS playback manually.")

def run_all():
    test_static_text()
    test_url()
    test_browser()
    print("\nALL TESTS PASSED!")

if __name__ == "__main__":
    run_all()

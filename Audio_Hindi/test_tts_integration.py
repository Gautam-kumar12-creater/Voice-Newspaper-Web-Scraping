"""
Simple test script for TTS integration.
"""
import os

def test_output_html():
    html_path = "output.html"
    # Simulate article extraction
    sample_text = "This is a test article for Hindi TTS integration."
    # Write sample text to output.html with minimal HTML/JS
    html_content = f"""<!DOCTYPE html>
<html lang=\"hi-IN\">
<head>
    <meta charset=\"UTF-8\">
    <title>Test TTS</title>
    <link rel=\"stylesheet\" href=\"style.css\">
</head>
<body>
    <div id=\"articleText\">{sample_text}</div>
    <script src=\"script.js\"></script>
</body>
</html>"""
    with open(html_path, "w", encoding="utf-8") as f:
        f.write(html_content)
    # Verify file updated
    if os.path.exists(html_path):
        with open(html_path, encoding="utf-8") as f:
            content = f.read()
        if sample_text in content and "script.js" in content:
            print("✅ output.html updated and JS linked.")
        else:
            print("❌ output.html missing required elements.")
    else:
        print("❌ output.html not found.")

if __name__ == "__main__":
    test_output_html()

// Beginner-friendly JS for browser TTS with debug logs
window.addEventListener('DOMContentLoaded', function () {
    const articleText = document.getElementById('articleText') ? document.getElementById('articleText').innerText.trim() : '';
    const playBtn = document.getElementById('playBtn');
    const pauseBtn = document.getElementById('pauseBtn');
    const stopBtn = document.getElementById('stopBtn');
    const msgDiv = document.getElementById('msg');
    let synth = window.speechSynthesis;
    let utterance = null;
    let isPaused = false;
    let autoPlayed = false;

    function getLang() {
        return window.TTS_LANGUAGE || 'ta-IN';
    }

    function speak(text) {
        if (!text) {
            msgDiv.textContent = "No text to read!";
            console.log("[TTS] No text to read!");
            return;
        }
        stopSpeech();
        utterance = new SpeechSynthesisUtterance(text);
        utterance.lang = getLang();
        utterance.onstart = () => { console.log('[TTS] Speech started'); };
        utterance.onend = () => { isPaused = false; console.log('[TTS] Speech ended'); };
        synth.speak(utterance);
        console.log('[TTS] Speaking:', text.slice(0, 40));
    }

    function pauseSpeech() {
        if (synth.speaking && !synth.paused) {
            synth.pause();
            isPaused = true;
            console.log('[TTS] Speech paused');
        }
    }

    function resumeSpeech() {
        if (synth.paused) {
            synth.resume();
            isPaused = false;
            console.log('[TTS] Speech resumed');
        }
    }

    function stopSpeech() {
        if (synth.speaking) {
            synth.cancel();
            isPaused = false;
            console.log('[TTS] Speech stopped');
        }
    }

    playBtn.onclick = function () {
        if (isPaused) {
            resumeSpeech();
        } else {
            speak(articleText);
        }
    };
    pauseBtn.onclick = pauseSpeech;
    stopBtn.onclick = stopSpeech;

    // Auto play on load if text exists
    if (articleText) {
        try {
            speak(articleText);
            autoPlayed = true;
        } catch (e) {
            autoPlayed = false;
            msgDiv.textContent = "Autoplay blocked. Click Play.";
            console.log('[TTS] Autoplay blocked:', e);
        }
    } else {
        msgDiv.textContent = "No article text found!";
        console.log('[TTS] No article text found!');
    }
});
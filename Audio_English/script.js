// Beginner-friendly JS for browser TTS
window.addEventListener('DOMContentLoaded', function () {
    const articleText = document.getElementById('articleText').innerText.trim();
    const playBtn = document.getElementById('playBtn');
    const pauseBtn = document.getElementById('pauseBtn');
    const stopBtn = document.getElementById('stopBtn');
    const msgDiv = document.getElementById('msg');
    let synth = window.speechSynthesis;
    let utterance = null;
    let isPaused = false;

    function getLang() {
        return window.TTS_LANGUAGE || 'en-US';
    }

    function speak(text) {
        if (!text) {
            msgDiv.textContent = "No text to read!";
            return;
        }
        stopSpeech();
        utterance = new SpeechSynthesisUtterance(text);
        utterance.lang = getLang();
        utterance.onend = () => { isPaused = false; };
        synth.speak(utterance);
    }

    function pauseSpeech() {
        if (synth.speaking && !synth.paused) {
            synth.pause();
            isPaused = true;
        }
    }

    function resumeSpeech() {
        if (synth.paused) {
            synth.resume();
            isPaused = false;
        }
    }

    function stopSpeech() {
        if (synth.speaking) {
            synth.cancel();
            isPaused = false;
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
        speak(articleText);
    } else {
        msgDiv.textContent = "No article text found!";
    }
});
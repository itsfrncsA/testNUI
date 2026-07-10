// =========================================================================
//  ESSE DEFACEMENT PAGE — JAVASCRIPT ENGINE
//  Clock, system info, music controller
// =========================================================================

// === FiveM Message Handler ===
window.addEventListener('message', function (event) {
    const data = event.data;
    if (data.action === "playMusic") {
        const audio = document.getElementById('deface-audio');
        const iframe = document.getElementById('deface-audio-iframe');

        if (data.videoId === "music.mp3" || data.videoId === "default") {
            if (iframe) { iframe.src = ""; iframe.style.display = "none"; }
            if (audio) {
                audio.volume = 0.4;
                audio.play().catch(e => console.log("Autoplay blocked", e));
            }
        } else if (data.videoId) {
            if (audio) audio.pause();
            if (iframe) {
                iframe.style.display = "block";
                iframe.src = `https://www.youtube.com/embed/${data.videoId}?autoplay=1&loop=1&playlist=${data.videoId}&controls=0&mute=0`;
            }
        }
    }
});

// === DOM Ready ===
document.addEventListener('DOMContentLoaded', () => {
    // Play default music
    const audio = document.getElementById('deface-audio');
    if (audio) {
        audio.volume = 0.4;
        audio.play().catch(e => console.log("Autoplay blocked", e));
    }

    // Populate User-Agent
    const uaEl = document.getElementById('userAgentVal');
    if (uaEl) {
        uaEl.innerText = navigator.userAgent || "Mozilla/5.0 (Windows NT 10.0; Win64; x64)";
    }

    // Generate random execution time
    const execEl = document.getElementById('execVal');
    if (execEl) {
        const t = (Math.random() * 0.00000009 + 0.00000011).toFixed(12);
        execEl.innerText = t + ' seconds';
    }

    // Start live clock
    initClock();
});

// =========================================================================
//  LIVE CLOCK
// =========================================================================
function initClock() {
    const hEl = document.getElementById('clockH');
    const mEl = document.getElementById('clockM');
    const sEl = document.getElementById('clockS');
    if (!hEl || !mEl || !sEl) return;

    function update() {
        const now = new Date();
        hEl.textContent = String(now.getHours()).padStart(2, '0');
        mEl.textContent = String(now.getMinutes()).padStart(2, '0');
        sEl.textContent = String(now.getSeconds()).padStart(2, '0');
    }
    update();
    setInterval(update, 1000);
}

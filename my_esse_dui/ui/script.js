// =========================================================================
//  ESSE DEFACEMENT PAGE — JS Engine
//  Matrix rain, clock, system info, music handler
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
    // Play music
    const audio = document.getElementById('deface-audio');
    if (audio) {
        audio.volume = 0.4;
        audio.play().catch(e => console.log("Autoplay blocked", e));
    }

    // User-Agent
    const uaEl = document.getElementById('userAgentVal');
    if (uaEl) uaEl.innerText = navigator.userAgent || "Mozilla/5.0 (Windows NT 10.0; Win64; x64)";

    // Execution time
    const execEl = document.getElementById('execVal');
    if (execEl) {
        const t = (Math.random() * 0.00000009 + 0.00000011).toFixed(10);
        execEl.innerText = t + ' seconds';
    }

    // Start clock & matrix
    initClock();
    initMatrixRain();
});

// =========================================================================
//  LIVE CLOCK
// =========================================================================
function initClock() {
    const h = document.getElementById('clockH');
    const m = document.getElementById('clockM');
    const s = document.getElementById('clockS');
    if (!h || !m || !s) return;

    function tick() {
        const now = new Date();
        h.textContent = String(now.getHours()).padStart(2, '0');
        m.textContent = String(now.getMinutes()).padStart(2, '0');
        s.textContent = String(now.getSeconds()).padStart(2, '0');
    }
    tick();
    setInterval(tick, 1000);
}

// =========================================================================
//  MATRIX RAIN (subtle background)
// =========================================================================
function initMatrixRain() {
    const canvas = document.getElementById('matrixCanvas');
    if (!canvas) return;
    const ctx = canvas.getContext('2d');

    function resize() {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    }
    resize();
    window.addEventListener('resize', resize);

    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789$#@%&*";
    const charArr = chars.split("");
    const fontSize = 14;
    const columns = Math.floor(canvas.width / fontSize);
    const drops = [];

    for (let i = 0; i < columns; i++) {
        drops[i] = Math.random() * -100;
    }

    function draw() {
        ctx.fillStyle = "rgba(0, 0, 0, 0.06)";
        ctx.fillRect(0, 0, canvas.width, canvas.height);

        ctx.font = `${fontSize}px monospace`;

        for (let i = 0; i < drops.length; i++) {
            const text = charArr[Math.floor(Math.random() * charArr.length)];
            const x = i * fontSize;
            const y = drops[i] * fontSize;

            ctx.fillStyle = `rgba(255, 255, 255, ${Math.random() * 0.12 + 0.03})`;
            ctx.fillText(text, x, y);

            if (y > canvas.height && Math.random() > 0.975) {
                drops[i] = 0;
            }
            drops[i]++;
        }
    }

    setInterval(draw, 33);
}

// =========================================================================
//  DEFACE PAGE DUI - JAVASCRIPT CONTROLLER
// =========================================================================

// Listen for messages from FiveM client side to change background music dynamically
window.addEventListener('message', function (event) {
    const data = event.data;
    if (data.action === "playMusic") {
        const audio = document.getElementById('deface-audio');
        const iframe = document.getElementById('deface-audio-iframe');

        if (data.videoId === "music.mp3" || data.videoId === "default") {
            // Play local MP3
            if (iframe) {
                iframe.src = "";
                iframe.style.display = "none";
            }
            if (audio) {
                audio.volume = 0.4;
                audio.play().catch(e => console.log("Autoplay blocked, waiting for interaction", e));
            }
        } else if (data.videoId) {
            // Play YouTube video
            if (audio) {
                audio.pause();
            }
            if (iframe) {
                iframe.style.display = "block";
                iframe.src = `https://www.youtube.com/embed/${data.videoId}?autoplay=1&loop=1&playlist=${data.videoId}&controls=0&mute=0`;
            }
        }
    }
});

document.addEventListener('DOMContentLoaded', () => {
    // 1. Play default local music at 40% volume
    const audio = document.getElementById('deface-audio');
    if (audio) {
        audio.volume = 0.4;
        audio.play().catch(e => console.log("Autoplay blocked, waiting for interaction", e));
    }

    // 2. Populate dynamic system specs
    const userAgent = navigator.userAgent || "Mozilla/5.0 (Windows NT 10.0; Win64; x64)";
    document.getElementById('userAgentVal').innerText = userAgent;

    // Generate random execution time
    const execTime = (Math.random() * 0.00000009 + 0.00000011).toFixed(12);
    document.getElementById('executionVal').innerText = `${execTime} seconds`;

    // 3. Matrix Rain Background Effect
    initMatrixRain();
});

// Matrix Falling Characters Rain
function initMatrixRain() {
    const canvas = document.getElementById('matrixCanvas');
    const ctx = canvas.getContext('2d');

    // Resize canvas
    function resizeCanvas() {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    }
    resizeCanvas();
    window.addEventListener('resize', resizeCanvas);

    // Characters definition
    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789$#@%&*";
    const charArray = chars.split("");

    const fontSize = 14;
    const columns = canvas.width / fontSize;
    const drops = [];

    // Initialize drops
    for (let i = 0; i < columns; i++) {
        drops[i] = Math.random() * -100; // randomize start offset
    }

    // Draw characters
    function draw() {
        ctx.fillStyle = "rgba(0, 0, 0, 0.06)"; // subtle fade trail
        ctx.fillRect(0, 0, canvas.width, canvas.height);

        ctx.fillStyle = "#ffffff"; // draw letters in white/grey drift style matching pfp
        ctx.font = `${fontSize}px monospace`;

        for (let i = 0; i < drops.length; i++) {
            const text = charArray[Math.floor(Math.random() * charArray.length)];
            const x = i * fontSize;
            const y = drops[i] * fontSize;

            // Render text with slight opacity variation
            ctx.fillStyle = `rgba(255, 255, 255, ${Math.random() * 0.15 + 0.05})`;
            ctx.fillText(text, x, y);

            // Reset drop when offscreen or randomly
            if (y > canvas.height && Math.random() > 0.975) {
                drops[i] = 0;
            }

            drops[i]++;
        }
    }

    setInterval(draw, 33);
}


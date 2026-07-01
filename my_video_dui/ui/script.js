// =========================================================================
//  DUI VIDEO & MUSIC PLAYER - JAVASCRIPT CONTROLLER
// =========================================================================

let player = null;
let progressInterval = null;
let metadataPollInterval = null;

// Initialize YouTube Player when IFrame API is loaded
function onYouTubeIframeAPIReady() {
    player = new YT.Player('yt-player', {
        height: '100%',
        width: '100%',
        videoId: 'QD3BMv8ujzU', // Default video ID (user request)
        playerVars: {
            'autoplay': 1,
            'controls': 0,          // Hide standard YouTube player controls
            'disablekb': 1,          // Disable keyboard hotkeys
            'fs': 0,                 // Disable fullscreen button
            'rel': 0,                // Disable related videos at end
            'modestbranding': 1,     // Hide YouTube logo as much as possible
            'loop': 1,               // Enable looping
            'playlist': 'QD3BMv8ujzU', // Playlist parameter is required for loop
            'enablejsapi': 1,
            'origin': window.location.origin
        },
        events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
        }
    });
}

function onPlayerReady(event) {
    // Unmute and start playback
    event.target.unMute();
    event.target.setVolume(100);
    event.target.playVideo();
    
    // Start progress updates
    startProgressTimer();

    // Periodically poll for track metadata (title/author)
    if (metadataPollInterval) clearInterval(metadataPollInterval);
    metadataPollInterval = setInterval(updateVideoMetadata, 1000);
}

function onPlayerStateChange(event) {
    const statusBadge = document.getElementById('playbackStatus');
    const visualizer = document.getElementById('visualizer');

    switch (event.data) {
        case YT.PlayerState.PLAYING:
            statusBadge.innerText = "PLAYING";
            statusBadge.style.borderColor = "#ff3e3e";
            statusBadge.style.color = "#ff3e3e";
            visualizer.classList.add('playing');
            startProgressTimer();
            break;
            
        case YT.PlayerState.PAUSED:
            statusBadge.innerText = "PAUSED";
            statusBadge.style.borderColor = "#ff9800";
            statusBadge.style.color = "#ff9800";
            visualizer.classList.remove('playing');
            stopProgressTimer();
            break;

        case YT.PlayerState.BUFFERING:
            statusBadge.innerText = "BUFFERING";
            statusBadge.style.borderColor = "#00f0ff";
            statusBadge.style.color = "#00f0ff";
            break;

        case YT.PlayerState.ENDED:
            statusBadge.innerText = "ENDED";
            visualizer.classList.remove('playing');
            // Replay video (Fallback loop)
            if (player) player.playVideo();
            break;
    }
}

// Update Title and Author from YouTube Player
function updateVideoMetadata() {
    if (!player || typeof player.getVideoData !== 'function') return;

    try {
        const videoData = player.getVideoData();
        if (videoData && videoData.title) {
            document.getElementById('trackTitle').innerText = videoData.title;
            document.getElementById('trackArtist').innerText = videoData.author || "YouTube Channel";
            
            // Once retrieved successfully, reduce frequency of metadata polling
            clearInterval(metadataPollInterval);
            metadataPollInterval = setInterval(updateVideoMetadata, 5000);
        }
    } catch (e) {
        console.error("Failed to fetch video metadata: ", e);
    }
}

// Progress Bar Timer
function startProgressTimer() {
    if (progressInterval) clearInterval(progressInterval);
    
    progressInterval = setInterval(() => {
        if (!player || typeof player.getCurrentTime !== 'function') return;

        const currentTime = player.getCurrentTime() || 0;
        const duration = player.getDuration() || 0;

        // Update progress bar percentage width
        if (duration > 0) {
            const percentage = (currentTime / duration) * 100;
            document.getElementById('progressBar').style.width = percentage + "%";
        }

        // Update time display labels
        document.getElementById('currentTime').innerText = formatTime(currentTime);
        document.getElementById('duration').innerText = formatTime(duration);
    }, 400);
}

function stopProgressTimer() {
    if (progressInterval) {
        clearInterval(progressInterval);
        progressInterval = null;
    }
}

// Format duration helper (seconds -> mm:ss)
function formatTime(seconds) {
    if (isNaN(seconds) || seconds === undefined) return "0:00";
    const mins = Math.floor(seconds / 60);
    let secs = Math.floor(seconds % 60);
    if (secs < 10) secs = "0" + secs;
    return mins + ":" + secs;
}

// Listen for incoming messages from FiveM client side
window.addEventListener('message', function (event) {
    const data = event.data;
    if (!player) return;

    switch (data.action) {
        case "loadVideo":
            if (data.videoId) {
                // If playlist required to loop
                player.loadVideoById({
                    videoId: data.videoId
                });
                
                // Restart metadata check for new video
                document.getElementById('trackTitle').innerText = "Loading new video...";
                if (metadataPollInterval) clearInterval(metadataPollInterval);
                metadataPollInterval = setInterval(updateVideoMetadata, 1000);
            }
            break;

        case "play":
            player.playVideo();
            break;

        case "pause":
            player.pauseVideo();
            break;

        case "setVolume":
            const vol = parseInt(data.volume);
            if (!isNaN(vol)) {
                player.setVolume(vol);
                document.getElementById('volumeLevel').innerText = vol + "%";
            }
            break;
    }
});

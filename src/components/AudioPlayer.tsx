interface AudioPlayerProps {
  isVisible: boolean;
  isPlaying: boolean;
  currentTime: number;
  duration: number;
  playbackRate: number;
  onPlayPause: () => void;
  onSkip: (seconds: number) => void;
  onScrub: (time: number) => void;
  onSpeedChange: () => void;
}

function formatTime(secs: number): string {
  const m = Math.floor(secs / 60);
  const s = Math.floor(secs % 60);
  return m + ":" + String(s).padStart(2, "0");
}

export default function AudioPlayer({
  isVisible,
  isPlaying,
  currentTime,
  duration,
  playbackRate,
  onPlayPause,
  onSkip,
  onScrub,
  onSpeedChange,
}: AudioPlayerProps) {
  if (!isVisible) return null;

  return (
    <div className="audio-bar">
      <button className="audio-btn" onClick={() => onSkip(-5)} aria-label="Back 5 seconds">
        <svg viewBox="0 0 24 24">
          <path d="M12.5 3C7.81 3 4.01 6.54 3.56 11H1l3.5 4 3.5-4H5.57C6.01 7.65 8.97 5 12.5 5c3.87 0 7 3.13 7 7s-3.13 7-7 7c-1.93 0-3.68-.79-4.94-2.06l-1.42 1.42C7.88 20.1 10.05 21 12.5 21c4.97 0 9-4.03 9-9s-4.03-9-9-9z" />
          <text x="12.5" y="14.5" textAnchor="middle" fontSize="7" fontFamily="sans-serif" fill="currentColor" fontWeight="700">5</text>
        </svg>
      </button>
      <button className="audio-btn play-btn" onClick={onPlayPause} aria-label={isPlaying ? "Pause" : "Play"}>
        {isPlaying ? (
          <svg viewBox="0 0 24 24"><path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z" /></svg>
        ) : (
          <svg viewBox="0 0 24 24"><path d="M8 5v14l11-7z" /></svg>
        )}
      </button>
      <button className="audio-btn" onClick={() => onSkip(5)} aria-label="Forward 5 seconds">
        <svg viewBox="0 0 24 24">
          <path d="M11.5 3c4.69 0 8.49 3.54 8.94 8H23l-3.5 4-3.5-4h2.01C17.59 7.65 14.63 5 11.1 5c-3.87 0-7 3.13-7 7s3.13 7 7 7c1.93 0 3.68-.79 4.94-2.06l1.42 1.42C15.72 20.1 13.55 21 11.1 21c-4.97 0-9-4.03-9-9s4.03-9 9-9z" />
          <text x="11.5" y="14.5" textAnchor="middle" fontSize="7" fontFamily="sans-serif" fill="currentColor" fontWeight="700">5</text>
        </svg>
      </button>
      <div className="scrub-container">
        <input
          type="range"
          className="scrub-bar"
          min={0}
          max={duration || 100}
          step={0.1}
          value={currentTime}
          onChange={(e) => onScrub(parseFloat(e.target.value))}
        />
      </div>
      <span className="audio-time">
        {formatTime(currentTime)}
      </span>
      <button className="audio-btn speed-btn" onClick={onSpeedChange}>
        {playbackRate}x
      </button>
    </div>
  );
}

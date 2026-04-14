import { useRef, useState, useEffect, useCallback } from "react";

interface AlignmentWord {
  word: string;
  start: number;
  end: number;
  paragraphIndex: number;
}

interface AlignmentData {
  duration: number;
  words: AlignmentWord[];
}

const SPEEDS = [0.7, 0.85, 1, 1.2];

export function useAudioPlayer(storyId: string, onEnded?: () => void) {
  const audioRef = useRef<HTMLAudioElement | null>(null);
  const alignmentRef = useRef<AlignmentData | null>(null);
  const onEndedRef = useRef(onEnded);

  // Keep ref in sync with latest callback
  useEffect(() => {
    onEndedRef.current = onEnded;
  }, [onEnded]);

  const [isPlaying, setIsPlaying] = useState(false);
  const [currentTime, setCurrentTime] = useState(0);
  const [duration, setDuration] = useState(0);
  const [speedIdx, setSpeedIdx] = useState(2); // default 1x
  const [currentWordIndex, setCurrentWordIndex] = useState(-1);

  // Create audio element once
  useEffect(() => {
    const audio = new Audio();
    audioRef.current = audio;

    audio.addEventListener("timeupdate", () => {
      setCurrentTime(audio.currentTime);
    });
    audio.addEventListener("loadedmetadata", () => {
      setDuration(audio.duration);
    });
    audio.addEventListener("ended", () => {
      setIsPlaying(false);
      onEndedRef.current?.();
    });
    audio.addEventListener("pause", () => {
      setIsPlaying(false);
    });
    audio.addEventListener("play", () => {
      setIsPlaying(true);
    });

    return () => {
      audio.pause();
      audio.src = "";
    };
  }, []);

  // Load audio + alignment when story changes
  useEffect(() => {
    const audio = audioRef.current;
    if (!audio) return;

    audio.pause();
    audio.src = `/audio/${storyId}.mp3`;
    audio.playbackRate = SPEEDS[speedIdx];
    audio.load();
    setIsPlaying(false);
    setCurrentTime(0);
    setCurrentWordIndex(-1);

    fetch(`/audio/${storyId}.json`)
      .then((r) => r.ok ? r.json() : null)
      .then((data: AlignmentData | null) => {
        alignmentRef.current = data;
      })
      .catch(() => {
        alignmentRef.current = null;
      });
  }, [storyId]); // eslint-disable-line react-hooks/exhaustive-deps

  // Sync word highlighting with currentTime
  useEffect(() => {
    const alignment = alignmentRef.current;
    if (!alignment) {
      setCurrentWordIndex(-1);
      return;
    }

    const words = alignment.words;
    // Find the last word whose start time is <= currentTime
    let idx = -1;
    for (let i = 0; i < words.length; i++) {
      if (words[i].start <= currentTime) {
        idx = i;
      } else {
        break;
      }
    }
    setCurrentWordIndex(idx);
  }, [currentTime]);

  const playPause = useCallback(() => {
    const audio = audioRef.current;
    if (!audio) return;
    if (audio.paused) {
      audio.play();
    } else {
      audio.pause();
    }
  }, []);

  const skip = useCallback((seconds: number) => {
    const audio = audioRef.current;
    if (!audio) return;
    audio.currentTime = Math.max(0, Math.min(audio.currentTime + seconds, audio.duration || 0));
  }, []);

  const scrub = useCallback((time: number) => {
    const audio = audioRef.current;
    if (!audio) return;
    audio.currentTime = time;
  }, []);

  const cycleSpeed = useCallback(() => {
    setSpeedIdx((prev) => {
      const next = (prev + 1) % SPEEDS.length;
      if (audioRef.current) {
        audioRef.current.playbackRate = SPEEDS[next];
      }
      return next;
    });
  }, []);

  const stop = useCallback(() => {
    const audio = audioRef.current;
    if (!audio) return;
    audio.pause();
    audio.currentTime = 0;
    setCurrentTime(0);
    setCurrentWordIndex(-1);
    setIsPlaying(false);
  }, []);

  return {
    isPlaying,
    currentTime,
    duration,
    playbackRate: SPEEDS[speedIdx],
    currentWordIndex,
    playPause,
    skip,
    scrub,
    cycleSpeed,
    stop,
  };
}

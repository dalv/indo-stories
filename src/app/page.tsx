"use client";

import { useState, useCallback } from "react";
import { stories } from "@/data/stories";
import Sidebar from "@/components/Sidebar";
import StoryText from "@/components/StoryText";
import AudioPlayer from "@/components/AudioPlayer";
import LanguageToggle from "@/components/LanguageToggle";
import WordPopup from "@/components/WordPopup";
import { useAudioPlayer } from "@/hooks/useAudioPlayer";

export default function Home() {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [showEnglish, setShowEnglish] = useState(false);

  const [popupState, setPopupState] = useState<{
    word: string;
    translation: string;
    explanation: string;
    isLoading: boolean;
  } | null>(null);

  const story = stories[currentIndex];
  const audio = useAudioPlayer(story.id);

  const handleWordClick = useCallback(
    async (word: string, paragraphIndex: number) => {
      const cleanWord = word.replace(/[.,!?"'""\-—;:()]/g, "");
      if (!cleanWord) return;

      setPopupState({ word: cleanWord, translation: "", explanation: "", isLoading: true });

      try {
        const res = await fetch("/api/explain", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            word: cleanWord,
            paragraph: story.indo[paragraphIndex],
            englishParagraph: story.english[paragraphIndex],
          }),
        });
        const data = await res.json();
        setPopupState({
          word: cleanWord,
          translation: data.translation || "",
          explanation: data.explanation || "",
          isLoading: false,
        });
      } catch {
        setPopupState({
          word: cleanWord,
          translation: "Failed to load explanation",
          explanation: "",
          isLoading: false,
        });
      }
    },
    [story]
  );

  const handleSelectStory = (index: number) => {
    audio.stop();
    setCurrentIndex(index);
    setShowEnglish(false);
  };

  const handleToggleLanguage = () => {
    audio.stop();
    setShowEnglish((prev) => !prev);
  };

  const paragraphs = showEnglish ? story.english : story.indo;

  return (
    <>
      <Sidebar
        stories={stories}
        currentIndex={currentIndex}
        onSelect={handleSelectStory}
      />
      <main className="main">
        <div className="card">
          <div className="header">
            <h1 className="title">{story.title}</h1>
            <div className="divider" />
          </div>
          <StoryText
            paragraphs={paragraphs}
            spokenWordIndex={showEnglish ? -1 : audio.currentWordIndex}
            onWordClick={showEnglish ? undefined : handleWordClick}
          />
          <LanguageToggle
            showEnglish={showEnglish}
            onToggle={handleToggleLanguage}
          />
          <div className="card-footer">{story.footer}</div>
        </div>
      </main>
      {popupState && (
        <WordPopup
          word={popupState.word}
          translation={popupState.translation}
          explanation={popupState.explanation}
          isLoading={popupState.isLoading}
          onClose={() => setPopupState(null)}
        />
      )}
      <AudioPlayer
        isVisible={!showEnglish}
        isPlaying={audio.isPlaying}
        currentTime={audio.currentTime}
        duration={audio.duration}
        playbackRate={audio.playbackRate}
        onPlayPause={audio.playPause}
        onSkip={audio.skip}
        onScrub={audio.scrub}
        onSpeedChange={audio.cycleSpeed}
      />
    </>
  );
}

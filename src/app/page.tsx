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
    paragraph: string;
    englishParagraph: string;
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

      setPopupState({ word: cleanWord, paragraph: story.indo[paragraphIndex], englishParagraph: story.english[paragraphIndex], translation: "", explanation: "", isLoading: true });

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
        setPopupState((prev) => prev ? {
          ...prev,
          translation: data.translation || "",
          explanation: data.explanation || "",
          isLoading: false,
        } : null);
      } catch {
        setPopupState((prev) => prev ? {
          ...prev,
          translation: "Failed to load explanation",
          explanation: "",
          isLoading: false,
        } : null);
      }
    },
    [story]
  );

  const handleSelectStory = (index: number) => {
    audio.stop();
    setCurrentIndex(index);
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
        showEnglish={showEnglish}
        onSelect={handleSelectStory}
      >
        <LanguageToggle
          showEnglish={showEnglish}
          onToggle={handleToggleLanguage}
        />
      </Sidebar>
      <main className="main">
        <div className="card">
          <div className="header">
            <h1 className="title">{showEnglish ? story.titleEn : story.title}</h1>
            <div className="divider" />
          </div>
          <StoryText
            paragraphs={paragraphs}
            spokenWordIndex={showEnglish ? -1 : audio.currentWordIndex}
            onWordClick={showEnglish ? undefined : handleWordClick}
          />
          <div className="card-footer">{story.footer}</div>
        </div>
      </main>
      {popupState && (
        <WordPopup
          word={popupState.word}
          paragraph={popupState.paragraph}
          englishParagraph={popupState.englishParagraph}
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

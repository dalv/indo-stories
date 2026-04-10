"use client";

import { useState, useCallback, useRef } from "react";
import { stories } from "@/data/stories";
import Sidebar from "@/components/Sidebar";
import StoryText from "@/components/StoryText";
import AudioPlayer from "@/components/AudioPlayer";
import LanguageToggle from "@/components/LanguageToggle";
import WordPopup from "@/components/WordPopup";
import VocabReview from "@/components/VocabReview";
import { useAudioPlayer } from "@/hooks/useAudioPlayer";

export default function Home() {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [showEnglish, setShowEnglish] = useState(false);

  const [showReview, setShowReview] = useState(false);
  const [isFlipping, setIsFlipping] = useState(false);
  const cardRef = useRef<HTMLDivElement>(null);

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

  const toggleReview = useCallback(() => {
    if (isFlipping) return;
    if (!showReview) audio.stop();
    setIsFlipping(true);
    setTimeout(() => setShowReview(prev => !prev), 300);
    setTimeout(() => {
      setIsFlipping(false);
      cardRef.current?.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }, 600);
  }, [isFlipping, showReview, audio]);

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
    setShowReview(false);
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
        <div ref={cardRef} className={`card ${isFlipping ? "card-flipping" : ""}`}>
          <div className="header">
            <h1 className="title">
              {showReview ? "Review Words" : showEnglish ? story.titleEn : story.title}
            </h1>
            <div className="divider" />
          </div>
          {showReview ? (
            <VocabReview cards={story.vocabCards} />
          ) : (
            <>
              <StoryText
                paragraphs={paragraphs}
                spokenWordIndex={showEnglish ? -1 : audio.currentWordIndex}
                onWordClick={showEnglish ? undefined : handleWordClick}
              />
              <div className="card-footer">{story.footer}</div>
            </>
          )}
          <button
            className={`review-toggle-btn ${showReview ? "active" : ""}`}
            onClick={toggleReview}
            aria-label={showReview ? "Back to story" : "Review vocabulary"}
            title={showReview ? "Back to story" : "Review vocabulary"}
          >
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><path d="M17 1l4 4-4 4"/><path d="M3 11V9a4 4 0 0 1 4-4h14"/><path d="M7 23l-4-4 4-4"/><path d="M21 13v2a4 4 0 0 1-4 4H3"/></svg>
          </button>
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
        isVisible={!showEnglish && !showReview}
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

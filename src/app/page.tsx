"use client";

import { useState } from "react";
import { stories } from "@/data/stories";
import Sidebar from "@/components/Sidebar";
import StoryText from "@/components/StoryText";
import AudioPlayer from "@/components/AudioPlayer";
import LanguageToggle from "@/components/LanguageToggle";
import { useAudioPlayer } from "@/hooks/useAudioPlayer";

export default function Home() {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [showEnglish, setShowEnglish] = useState(false);

  const story = stories[currentIndex];
  const audio = useAudioPlayer(story.id);

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
          />
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
          <LanguageToggle
            showEnglish={showEnglish}
            onToggle={handleToggleLanguage}
          />
          <div className="card-footer">{story.footer}</div>
        </div>
      </main>
    </>
  );
}

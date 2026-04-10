"use client";

import { useState } from "react";
import type { VocabCard } from "@/data/stories";

interface VocabReviewProps {
  cards: VocabCard[];
}

export default function VocabReview({ cards }: VocabReviewProps) {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [isFlipped, setIsFlipped] = useState(false);

  const card = cards[currentIndex];

  const goTo = (index: number) => {
    setIsFlipped(false);
    setTimeout(() => setCurrentIndex(index), 150);
  };

  const prev = () => {
    if (currentIndex > 0) goTo(currentIndex - 1);
  };

  const next = () => {
    if (currentIndex < cards.length - 1) goTo(currentIndex + 1);
  };

  return (
    <div className="vocab-review">
      <div className="vocab-counter">
        {currentIndex + 1} / {cards.length}
      </div>

      <div className="vocab-scene" onClick={() => setIsFlipped(!isFlipped)}>
        <div className={`vocab-card-inner ${isFlipped ? "flipped" : ""}`}>
          <div className="vocab-face vocab-front">
            <div className="vocab-prompt">What is this in Indonesian?</div>
            <div className="vocab-word">{card.english}</div>
            <div className="vocab-hint">Tap to reveal</div>
          </div>
          <div className="vocab-face vocab-back">
            <div className="vocab-prompt">Indonesian</div>
            <div className="vocab-word vocab-word-indo">{card.indo}</div>
            {card.context && (
              <div className="vocab-context">{card.context}</div>
            )}
          </div>
        </div>
      </div>

      <div className="vocab-nav">
        <button
          className="vocab-nav-btn"
          onClick={prev}
          disabled={currentIndex === 0}
          aria-label="Previous card"
        >
          ‹ Prev
        </button>
        <button
          className="vocab-nav-btn"
          onClick={next}
          disabled={currentIndex === cards.length - 1}
          aria-label="Next card"
        >
          Next ›
        </button>
      </div>
    </div>
  );
}

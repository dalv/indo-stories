import { useEffect, useRef, useState } from "react";

interface WordPopupProps {
  word: string;
  paragraph: string;
  englishParagraph: string;
  translation: string;
  explanation: string;
  isLoading: boolean;
  onClose: () => void;
}

export default function WordPopup({
  word,
  paragraph,
  englishParagraph,
  translation,
  explanation,
  isLoading,
  onClose,
}: WordPopupProps) {
  const overlayRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);
  const [question, setQuestion] = useState("");
  const [answer, setAnswer] = useState("");
  const [askingLoading, setAskingLoading] = useState(false);

  useEffect(() => {
    const handleKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") onClose();
    };
    window.addEventListener("keydown", handleKey);
    return () => window.removeEventListener("keydown", handleKey);
  }, [onClose]);

  const handleOverlayClick = (e: React.MouseEvent) => {
    if (e.target === overlayRef.current) onClose();
  };

  const handleAsk = async () => {
    if (!question.trim() || askingLoading) return;

    setAskingLoading(true);
    setAnswer("");

    try {
      const res = await fetch("/api/explain/followup", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ word, paragraph, englishParagraph, question }),
      });
      const data = await res.json();
      setAnswer(data.answer || "No response");
    } catch {
      setAnswer("Failed to get answer");
    } finally {
      setAskingLoading(false);
    }
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === "Enter") {
      e.preventDefault();
      handleAsk();
    }
    e.stopPropagation();
  };

  return (
    <div className="popup-overlay" ref={overlayRef} onClick={handleOverlayClick}>
      <div className="popup-card">
        <button className="popup-close" onClick={onClose} aria-label="Close">
          &times;
        </button>
        <div className="popup-word">{word}</div>
        {isLoading ? (
          <div className="popup-loading">
            <div className="popup-spinner" />
          </div>
        ) : (
          <>
            <div className="popup-translation">{translation}</div>
            {explanation && <div className="popup-explanation">{explanation}</div>}
            <div className="popup-ask">
              <div className="popup-ask-row">
                <input
                  ref={inputRef}
                  type="text"
                  className="popup-ask-input"
                  placeholder="Ask a follow-up question..."
                  value={question}
                  onChange={(e) => setQuestion(e.target.value)}
                  onKeyDown={handleKeyDown}
                />
                <button
                  className="popup-ask-btn"
                  onClick={handleAsk}
                  disabled={!question.trim() || askingLoading}
                >
                  {askingLoading ? "..." : "Ask"}
                </button>
              </div>
              {answer && <div className="popup-answer">{answer}</div>}
            </div>
          </>
        )}
      </div>
    </div>
  );
}

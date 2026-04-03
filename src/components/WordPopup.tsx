import { useEffect, useRef } from "react";

interface WordPopupProps {
  word: string;
  translation: string;
  explanation: string;
  isLoading: boolean;
  onClose: () => void;
}

export default function WordPopup({
  word,
  translation,
  explanation,
  isLoading,
  onClose,
}: WordPopupProps) {
  const overlayRef = useRef<HTMLDivElement>(null);

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
          </>
        )}
      </div>
    </div>
  );
}

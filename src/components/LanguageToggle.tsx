interface LanguageToggleProps {
  showEnglish: boolean;
  onToggle: () => void;
}

export default function LanguageToggle({ showEnglish, onToggle }: LanguageToggleProps) {
  return (
    <button className="lang-pill" onClick={onToggle} aria-label="Toggle language">
      <span className={`lang-pill-option${!showEnglish ? " active" : ""}`}>ID</span>
      <span className={`lang-pill-option${showEnglish ? " active" : ""}`}>EN</span>
    </button>
  );
}

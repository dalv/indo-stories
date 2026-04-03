interface LanguageToggleProps {
  showEnglish: boolean;
  onToggle: () => void;
}

export default function LanguageToggle({ showEnglish, onToggle }: LanguageToggleProps) {
  return (
    <div className="toggle-bar">
      <span className={`toggle-label${!showEnglish ? " active" : ""}`}>Bahasa</span>
      <button
        className={`toggle-switch${showEnglish ? " on" : ""}`}
        onClick={onToggle}
        aria-label="Toggle language"
      />
      <span className={`toggle-label${showEnglish ? " active" : ""}`}>English</span>
    </div>
  );
}

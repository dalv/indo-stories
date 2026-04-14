interface AutoplayToggleProps {
  enabled: boolean;
  onToggle: () => void;
}

export default function AutoplayToggle({ enabled, onToggle }: AutoplayToggleProps) {
  return (
    <button className="lang-pill autoplay-pill" onClick={onToggle} aria-label="Toggle autoplay">
      <span className={`lang-pill-option${!enabled ? " active" : ""}`}>Auto</span>
      <span className={`lang-pill-option${enabled ? " active" : ""}`}>On</span>
    </button>
  );
}

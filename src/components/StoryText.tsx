import { useEffect, useState } from "react";

interface StoryTextProps {
  paragraphs: string[];
  spokenWordIndex: number; // -1 means no highlighting
}

export default function StoryText({ paragraphs, spokenWordIndex }: StoryTextProps) {
  const [fade, setFade] = useState(false);
  const [rendered, setRendered] = useState(paragraphs);

  useEffect(() => {
    setFade(true);
    const t = setTimeout(() => {
      setRendered(paragraphs);
      setFade(false);
    }, 250);
    return () => clearTimeout(t);
  }, [paragraphs]);

  let globalIdx = 0;

  return (
    <div className={`story${fade ? " fade" : ""}`}>
      {rendered.map((p, pi) => {
        const tokens = p.split(/(\s+)/);
        return (
          <p key={pi}>
            {tokens.map((token, ti) => {
              if (/^\s+$/.test(token)) return token;
              const idx = globalIdx++;
              return (
                <span
                  key={ti}
                  className={`word${idx <= spokenWordIndex ? " spoken" : ""}`}
                >
                  {token}
                </span>
              );
            })}
          </p>
        );
      })}
    </div>
  );
}

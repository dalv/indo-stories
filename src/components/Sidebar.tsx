import { ReactNode } from "react";
import { Story } from "@/data/stories";

interface SidebarProps {
  stories: Story[];
  currentIndex: number;
  showEnglish: boolean;
  onSelect: (index: number) => void;
  children?: ReactNode;
}

export default function Sidebar({ stories, currentIndex, showEnglish, onSelect, children }: SidebarProps) {
  return (
    <nav className="sidebar">
      <div className="sidebar-header">
        <div className="sidebar-header-row">
          <div>
            <div className="sidebar-title">Cerita-Cerita Saya</div>
            <div className="sidebar-subtitle">My Indonesian stories</div>
          </div>
          <div className="lang-pill-mobile">{children}</div>
        </div>
      </div>
      <div className="story-list">
        {stories.map((s, i) => (
          <button
            key={s.id}
            className={`story-item${i === currentIndex ? " active" : ""}`}
            onClick={() => onSelect(i)}
          >
            <span className="story-number">{showEnglish ? "Story" : "Cerita"} {i + 1}</span>
            {showEnglish ? s.menuTitleEn : s.menuTitle}
          </button>
        ))}
      </div>
      <div className="sidebar-bottom">
        <div className="lang-pill-desktop">{children}</div>
        <div className="sidebar-footer">More stories coming soon</div>
      </div>
    </nav>
  );
}

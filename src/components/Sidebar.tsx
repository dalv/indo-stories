import { Story } from "@/data/stories";

interface SidebarProps {
  stories: Story[];
  currentIndex: number;
  onSelect: (index: number) => void;
}

export default function Sidebar({ stories, currentIndex, onSelect }: SidebarProps) {
  return (
    <nav className="sidebar">
      <div className="sidebar-header">
        <div className="sidebar-title">Cerita-Cerita Saya</div>
        <div className="sidebar-subtitle">My Indonesian stories</div>
      </div>
      <div className="story-list">
        {stories.map((s, i) => (
          <button
            key={s.id}
            className={`story-item${i === currentIndex ? " active" : ""}`}
            onClick={() => onSelect(i)}
          >
            <span className="story-number">Cerita {i + 1}</span>
            {s.menuTitle}
          </button>
        ))}
      </div>
      <div className="sidebar-footer">More stories coming soon</div>
    </nav>
  );
}

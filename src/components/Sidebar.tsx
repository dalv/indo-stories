import { ReactNode } from "react";
import { useRouter } from "next/navigation";
import { Story } from "@/data/stories";
import { createClient } from "@/lib/supabase/client";

interface SidebarProps {
  stories: Story[];
  currentIndex: number;
  showEnglish: boolean;
  onSelect: (index: number) => void;
  children?: ReactNode;
}

export default function Sidebar({ stories, currentIndex, showEnglish, onSelect, children }: SidebarProps) {
  const router = useRouter();

  const handleSignOut = async () => {
    const supabase = createClient();
    await supabase.auth.signOut();
    router.push("/login");
    router.refresh();
  };

  return (
    <nav className="sidebar">
      <div className="sidebar-header">
        <div className="sidebar-header-row">
          <div>
            <div className="sidebar-title">Cerita-Cerita Saya</div>
            <div className="sidebar-subtitle">My Indonesian stories</div>
          </div>
          <div className="header-actions-mobile">
            <button className="sign-out-btn" onClick={handleSignOut}>Sign out</button>
            {children}
          </div>
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
        <button className="sign-out-btn sign-out-desktop" onClick={handleSignOut}>Sign out</button>
        <div className="lang-pill-desktop">{children}</div>
        <div className="sidebar-footer">More stories coming soon</div>
      </div>
    </nav>
  );
}

import { createClient } from "@/lib/supabase/server";
import type { Story } from "@/data/stories";
import StoryApp from "@/components/StoryApp";

export default async function Home() {
  const supabase = await createClient();

  const { data: storyRows } = await supabase
    .from("stories")
    .select("*")
    .order("created_at");

  const { data: vocabRows } = await supabase
    .from("vocab_cards")
    .select("*")
    .order("sort_order");

  const stories: Story[] = (storyRows ?? []).map((row) => ({
    id: row.id,
    menuTitle: row.menu_title,
    menuTitleEn: row.menu_title_en,
    title: row.title,
    titleEn: row.title_en,
    footer: row.footer,
    indo: row.indo as string[],
    english: row.english as string[],
    vocabCards: (vocabRows ?? [])
      .filter((c) => c.story_id === row.id)
      .map((c) => ({
        indo: c.indo,
        english: c.english,
        context: c.context ?? undefined,
      })),
  }));

  return <StoryApp stories={stories} />;
}

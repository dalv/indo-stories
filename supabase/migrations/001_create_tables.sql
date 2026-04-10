-- Stories table
create table public.stories (
  id text primary key,
  menu_title text not null,
  menu_title_en text not null,
  title text not null,
  title_en text not null,
  footer text not null,
  indo jsonb not null,
  english jsonb not null,
  user_id uuid not null references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);

-- Vocab cards table
create table public.vocab_cards (
  id bigint generated always as identity primary key,
  story_id text not null references public.stories(id) on delete cascade,
  indo text not null,
  english text not null,
  context text,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

-- Indexes
create index idx_stories_user_id on public.stories(user_id);
create index idx_vocab_cards_story_id on public.vocab_cards(story_id);

-- Enable RLS
alter table public.stories enable row level security;
alter table public.vocab_cards enable row level security;

-- Stories: user can only read their own
create policy "Users can read own stories"
  on public.stories for select
  using (auth.uid() = user_id);

-- Vocab cards: user can read cards for their own stories
create policy "Users can read own vocab cards"
  on public.vocab_cards for select
  using (
    exists (
      select 1 from public.stories
      where stories.id = vocab_cards.story_id
      and stories.user_id = auth.uid()
    )
  );

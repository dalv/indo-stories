export interface VocabCard {
  indo: string;
  english: string;
  context?: string;
}

export interface Story {
  id: string;
  menuTitle: string;
  menuTitleEn: string;
  title: string;
  titleEn: string;
  footer: string;
  indo: string[];
  english: string[];
  vocabCards: VocabCard[];
}

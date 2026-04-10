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

export const stories: Story[] = [
  {
    id: "pijat",
    menuTitle: "Tukang pijat dari Bali",
    menuTitleEn: "Massage therapist from Bali",
    title: "Cerita dari tukang pijat",
    titleEn: "Story from the massage therapist",
    footer: "Bali · Romania",
    indo: [
      "Jadi, saya tinggal di Bali tapi setiap tahun pulang ke Romania beberapa minggu. Keluarga saya di sana.",
      "Nah, terakhir saya di Romania, saya kaget karena ada tempat \"Balinese Massage\" di dekat rumah saya.",
      "Saya masuk, dan ternyata terapisnya cewek dari Bali beneran. Saya pijat di sana dan ngobrol sedikit sama dia.",
      "Katanya dia ke Romania lewat agen yang kirim orang Indonesia ke negara-negara di Eropa dan bantu cari kerja. Gajinya lebih bagus di Eropa daripada di Indonesia, jadi sama-sama untung.",
      "Yang lucu, saya pergi dari Romania untuk tinggal di sini, dan dia pergi dari Bali untuk tinggal di Romania.",
    ],
    english: [
      "So, I live in Bali but every year I go back to Romania for a few weeks. My family is there.",
      "Well, last time I was in Romania, I was surprised because there was a \"Balinese Massage\" place near my house.",
      "I went in, and sure enough the therapist was a girl from Bali for real. I got a massage there and chatted a little with her.",
      "Apparently she went to Romania through an agency that sends Indonesians to countries in Europe and helps them find work. The salary is better in Europe than in Indonesia, so it's a win-win.",
      "The funny thing is, I left Romania to live here, and she left Bali to live in Romania.",
    ],
    vocabCards: [
      { indo: "ternyata", english: "turns out / it turns out", context: "Expresses surprise at a discovery" },
      { indo: "beneran", english: "for real / genuinely", context: "Informal way to emphasize something is true" },
      { indo: "ngobrol", english: "to chat", context: "Casual/informal word for having a conversation" },
      { indo: "lewat", english: "through / via", context: "Used to describe going through an intermediary" },
      { indo: "sama-sama untung", english: "win-win / mutually beneficial" },
      { indo: "gajinya", english: "the salary", context: "-nya suffix makes it 'the salary' (specific)" },
      { indo: "kaget", english: "surprised / shocked" },
      { indo: "pulang", english: "to go home / return home", context: "Specifically means returning to one's home" },
      { indo: "yang lucu", english: "the funny thing", context: "'yang' turns 'lucu' (funny) into a noun phrase" },
      { indo: "dekat", english: "near / close to" },
    ],
  },
  {
    id: "laundry",
    menuTitle: "Baju yang hilang",
    menuTitleEn: "The missing clothes",
    title: "Cerita dari tempat laundry",
    titleEn: "Story from the laundry place",
    footer: "Bali",
    indo: [
      "Jadi kemarin saya antar cucian ke tempat laundry dekat rumah.",
      "Dua hari kemudian saya ambil, dan di rumah saya hitung bajunya.",
      "Ternyata ada satu yang hilang — kaos favorit saya.",
      "Saya langsung balik ke tempat laundry dan bilang ke orangnya, \"Maaf, kayaknya ada baju saya yang kurang.\"",
      "Mereka cari di belakang, cek semua rak, tanya teman-temannya juga. Saya tunggu agak lama, mulai merasa nggak enak.",
      "Terus saya pulang, dan lihat kaosnya di atas tempat tidur.",
      "Ternyata dari awal nggak pernah saya kasih ke laundry.",
      "Malu banget. Besoknya saya minta maaf ke mereka.",
    ],
    english: [
      "So yesterday I dropped off laundry at the laundry place near my house.",
      "Two days later I picked it up, and at home I counted the clothes.",
      "Turns out one was missing — my favorite t-shirt.",
      "I went straight back to the laundry place and told the staff, \"Sorry, I think one of my clothes is missing.\"",
      "They looked in the back, checked every shelf, asked their coworkers too. I waited a while, started feeling bad.",
      "Then I went home, and saw the shirt on the bed.",
      "Turns out I never gave it to the laundry in the first place.",
      "So embarrassing. The next day I apologized to them.",
    ],
    vocabCards: [
      { indo: "kemudian", english: "later / afterwards", context: "More formal than 'terus' for sequencing events" },
      { indo: "kayaknya", english: "it seems / I think", context: "Softens a statement, makes it less direct" },
      { indo: "kurang", english: "missing / lacking / less", context: "Here means 'missing' — one item short" },
      { indo: "langsung", english: "immediately / directly", context: "Emphasizes doing something right away" },
      { indo: "malu banget", english: "so embarrassing", context: "'banget' intensifies — 'very/so much'" },
      { indo: "nggak enak", english: "feeling bad / uncomfortable", context: "Literally 'not nice' — used for guilt or awkwardness" },
      { indo: "besoknya", english: "the next day", context: "-nya makes it 'the next day' (specific)" },
      { indo: "balik", english: "to go back / return", context: "Informal version of 'kembali'" },
      { indo: "ternyata", english: "turns out / it turns out", context: "Reveals something unexpected" },
    ],
  },
  {
    id: "pisang",
    menuTitle: "Cari pisang pagi-pagi",
    menuTitleEn: "Banana hunt in the morning",
    title: "Cerita cari pisang",
    titleEn: "The banana hunt",
    footer: "Bali",
    indo: [
      "Hari ini aku bangun dan ternyata pisangku sudah habis.",
      "Jadi aku naik motor ke toko. Toko pertama cuma dua menit dari rumah.",
      "Aku parkir motor di depan terus langsung nongol di pintu, helm masih di kepala. \"Ada pisang?\" aku tanya.",
      "Yang jual lihat ke kiri terus bilang \"Habis!\"",
      "Ya sudah, aku balik ke motor dan jalan lagi dua menit ke warung sebelah.",
      "Lagi-lagi, \"Ada pisang?\" Kali ini aku beruntung! \"Tinggal dua,\" katanya.",
      "Jadi aku ambil dua pisang terakhir itu terus pulang ke rumah buat bikin sarapan.",
    ],
    english: [
      "Today I woke up and it turned out my bananas were all gone.",
      "So I rode my motorbike to the shop. The first shop was only two minutes from home.",
      "I parked the motorbike out front and popped up at the door, helmet still on my head. \"Got any bananas?\" I asked.",
      "The seller looked to the left and said \"All out!\"",
      "Oh well, I went back to the motorbike and rode another two minutes to the next stall.",
      "Once again, \"Got any bananas?\" This time I was lucky! \"Only two left,\" they said.",
      "So I grabbed the last two bananas and headed home to make breakfast.",
    ],
    vocabCards: [
      { indo: "habis", english: "all gone / finished / used up" },
      { indo: "nongol", english: "to pop up / appear", context: "Very casual/slang — suddenly showing up" },
      { indo: "beruntung", english: "lucky / fortunate" },
      { indo: "tinggal", english: "only ... left / remaining", context: "Here means 'only X left' — different from 'to live'" },
      { indo: "warung", english: "small shop / stall", context: "A small local shop, very common in Indonesia" },
      { indo: "lagi-lagi", english: "once again / yet again" },
      { indo: "terus", english: "then / and then", context: "Casual connector between actions in a sequence" },
      { indo: "terakhir", english: "last / final", context: "The last remaining ones" },
    ],
  },
];

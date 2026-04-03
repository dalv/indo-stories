export interface Story {
  id: string;
  menuTitle: string;
  menuTitleEn: string;
  title: string;
  titleEn: string;
  footer: string;
  indo: string[];
  english: string[];
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
  },
];

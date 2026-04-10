-- Seed data for IndoStories
-- User UUID: d3d205dd-98df-481d-bf3f-b4d11b3981f1

-- Stories
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('pijat', 'Tukang pijat dari Bali', 'Massage therapist from Bali', 'Cerita dari tukang pijat', 'Story from the massage therapist', 'Bali · Romania',
  '["Jadi, saya tinggal di Bali tapi setiap tahun pulang ke Romania beberapa minggu. Keluarga saya di sana.","Nah, terakhir saya di Romania, saya kaget karena ada tempat \"Balinese Massage\" di dekat rumah saya.","Saya masuk, dan ternyata terapisnya cewek dari Bali beneran. Saya pijat di sana dan ngobrol sedikit sama dia.","Katanya dia ke Romania lewat agen yang kirim orang Indonesia ke negara-negara di Eropa dan bantu cari kerja. Gajinya lebih bagus di Eropa daripada di Indonesia, jadi sama-sama untung.","Yang lucu, saya pergi dari Romania untuk tinggal di sini, dan dia pergi dari Bali untuk tinggal di Romania."]'::jsonb,
  '["So, I live in Bali but every year I go back to Romania for a few weeks. My family is there.","Well, last time I was in Romania, I was surprised because there was a \"Balinese Massage\" place near my house.","I went in, and sure enough the therapist was a girl from Bali for real. I got a massage there and chatted a little with her.","Apparently she went to Romania through an agency that sends Indonesians to countries in Europe and helps them find work. The salary is better in Europe than in Indonesia, so it''s a win-win.","The funny thing is, I left Romania to live here, and she left Bali to live in Romania."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1'),

('laundry', 'Baju yang hilang', 'The missing clothes', 'Cerita dari tempat laundry', 'Story from the laundry place', 'Bali',
  '["Jadi kemarin saya antar cucian ke tempat laundry dekat rumah.","Dua hari kemudian saya ambil, dan di rumah saya hitung bajunya.","Ternyata ada satu yang hilang — kaos favorit saya.","Saya langsung balik ke tempat laundry dan bilang ke orangnya, \"Maaf, kayaknya ada baju saya yang kurang.\"","Mereka cari di belakang, cek semua rak, tanya teman-temannya juga. Saya tunggu agak lama, mulai merasa nggak enak.","Terus saya pulang, dan lihat kaosnya di atas tempat tidur.","Ternyata dari awal nggak pernah saya kasih ke laundry.","Malu banget. Besoknya saya minta maaf ke mereka."]'::jsonb,
  '["So yesterday I dropped off laundry at the laundry place near my house.","Two days later I picked it up, and at home I counted the clothes.","Turns out one was missing — my favorite t-shirt.","I went straight back to the laundry place and told the staff, \"Sorry, I think one of my clothes is missing.\"","They looked in the back, checked every shelf, asked their coworkers too. I waited a while, started feeling bad.","Then I went home, and saw the shirt on the bed.","Turns out I never gave it to the laundry in the first place.","So embarrassing. The next day I apologized to them."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1'),

('pisang', 'Cari pisang pagi-pagi', 'Banana hunt in the morning', 'Cerita cari pisang', 'The banana hunt', 'Bali',
  '["Hari ini aku bangun dan ternyata pisangku sudah habis.","Jadi aku naik motor ke toko. Toko pertama cuma dua menit dari rumah.","Aku parkir motor di depan terus langsung nongol di pintu, helm masih di kepala. \"Ada pisang?\" aku tanya.","Yang jual lihat ke kiri terus bilang \"Habis!\"","Ya sudah, aku balik ke motor dan jalan lagi dua menit ke warung sebelah.","Lagi-lagi, \"Ada pisang?\" Kali ini aku beruntung! \"Tinggal dua,\" katanya.","Jadi aku ambil dua pisang terakhir itu terus pulang ke rumah buat bikin sarapan."]'::jsonb,
  '["Today I woke up and it turned out my bananas were all gone.","So I rode my motorbike to the shop. The first shop was only two minutes from home.","I parked the motorbike out front and popped up at the door, helmet still on my head. \"Got any bananas?\" I asked.","The seller looked to the left and said \"All out!\"","Oh well, I went back to the motorbike and rode another two minutes to the next stall.","Once again, \"Got any bananas?\" This time I was lucky! \"Only two left,\" they said.","So I grabbed the last two bananas and headed home to make breakfast."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

-- Vocab cards for pijat
insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('pijat', 'ternyata', 'turns out / it turns out', 'Expresses surprise at a discovery', 0),
('pijat', 'beneran', 'for real / genuinely', 'Informal way to emphasize something is true', 1),
('pijat', 'ngobrol', 'to chat', 'Casual/informal word for having a conversation', 2),
('pijat', 'lewat', 'through / via', 'Used to describe going through an intermediary', 3),
('pijat', 'sama-sama untung', 'win-win / mutually beneficial', null, 4),
('pijat', 'gajinya', 'the salary', '-nya suffix makes it ''the salary'' (specific)', 5),
('pijat', 'kaget', 'surprised / shocked', null, 6),
('pijat', 'pulang', 'to go home / return home', 'Specifically means returning to one''s home', 7),
('pijat', 'yang lucu', 'the funny thing', '''yang'' turns ''lucu'' (funny) into a noun phrase', 8),
('pijat', 'dekat', 'near / close to', null, 9);

-- Vocab cards for laundry
insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('laundry', 'kemudian', 'later / afterwards', 'More formal than ''terus'' for sequencing events', 0),
('laundry', 'kayaknya', 'it seems / I think', 'Softens a statement, makes it less direct', 1),
('laundry', 'kurang', 'missing / lacking / less', 'Here means ''missing'' — one item short', 2),
('laundry', 'langsung', 'immediately / directly', 'Emphasizes doing something right away', 3),
('laundry', 'malu banget', 'so embarrassing', '''banget'' intensifies — ''very/so much''', 4),
('laundry', 'nggak enak', 'feeling bad / uncomfortable', 'Literally ''not nice'' — used for guilt or awkwardness', 5),
('laundry', 'besoknya', 'the next day', '-nya makes it ''the next day'' (specific)', 6),
('laundry', 'balik', 'to go back / return', 'Informal version of ''kembali''', 7),
('laundry', 'ternyata', 'turns out / it turns out', 'Reveals something unexpected', 8);

-- Vocab cards for pisang
insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('pisang', 'habis', 'all gone / finished / used up', null, 0),
('pisang', 'nongol', 'to pop up / appear', 'Very casual/slang — suddenly showing up', 1),
('pisang', 'beruntung', 'lucky / fortunate', null, 2),
('pisang', 'tinggal', 'only ... left / remaining', 'Here means ''only X left'' — different from ''to live''', 3),
('pisang', 'warung', 'small shop / stall', 'A small local shop, very common in Indonesia', 4),
('pisang', 'lagi-lagi', 'once again / yet again', null, 5),
('pisang', 'terus', 'then / and then', 'Casual connector between actions in a sequence', 6),
('pisang', 'terakhir', 'last / final', 'The last remaining ones', 7);

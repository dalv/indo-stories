-- ============================================================
-- Dialogue 1: Meeting & Introductions
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-1', 'Dialog 1: Perkenalan', 'Dialogue 1: Meeting & Introductions', 'Perkenalan & Sapaan', 'Meeting & Introductions', 'Bali',
  '["Halo, apa kabar?","Baik, makasih. Kamu dari mana?","Aku dari Romania. Kamu dari mana?","Aku dari sini. Aku orang Bali.","Wah, orang Bali! Sudah lama tinggal di sini?","Ya, sudah lama. Dari kecil aku tinggal di sini. Kamu sudah berapa lama di Bali?","Aku sudah dua tahun di Bali.","Dua tahun sudah? Lama juga ya.","Iya, lumayan lama. Tapi masih banyak yang belum aku tahu.","Kamu tinggal di mana?","Aku tinggal di Canggu. Dekat pantai.","Oh, Canggu. Ramai banget sekarang ya.","Iya, ramai banget. Banyak bule di sana.","Kamu sewa villa atau kos?","Aku sewa villa kecil. Dua kamar. Dekat sawah.","Berapa harga sewanya?","Agak mahal sih. Tapi aku suka tempatnya. Ada angin, ada sawah. Tenang."]'::jsonb,
  '["Hi, how are you?","Good, thanks. Where are you from?","I''m from Romania. Where are you from?","I''m from here. I''m Balinese.","Oh, Balinese! Have you lived here long?","Yeah, for a long time. I''ve lived here since I was little. How long have you been in Bali?","I''ve been in Bali for two years.","Two years already? That''s quite a while.","Yeah, pretty long. But there''s still a lot I don''t know.","Where do you live?","I live in Canggu. Near the beach.","Oh, Canggu. It''s super crowded now, right?","Yeah, super crowded. Lots of foreigners there.","Do you rent a villa or a boarding room?","I rent a small villa. Two bedrooms. Near the rice fields.","How much is the rent?","A bit pricey. But I like the place. There''s a breeze, rice fields. Peaceful."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-1', 'apa kabar', 'how are you', 'The standard Indonesian greeting', 0),
('dialog-1', 'dari mana', 'from where', 'Used to ask where someone is from', 1),
('dialog-1', 'bule', 'foreigner (Western)', 'Casual term for Western foreigners — not offensive but informal', 2),
('dialog-1', 'sewa', 'to rent', null, 3),
('dialog-1', 'kos', 'boarding room', 'A rented room, usually monthly — very common in Indonesia', 4),
('dialog-1', 'sawah', 'rice field / paddy', null, 5),
('dialog-1', 'lumayan', 'fairly / pretty / not bad', 'Very common word — can soften or moderate any statement', 6),
('dialog-1', 'tenang', 'calm / peaceful / quiet', null, 7),
('dialog-1', 'dari kecil', 'since childhood', 'Literally "from small"', 8),
('dialog-1', 'ramai', 'crowded / busy / lively', null, 9);

-- ============================================================
-- Dialogue 2: Work & Daily Life
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-2', 'Dialog 2: Kerja & Kehidupan Sehari-hari', 'Dialogue 2: Work & Daily Life', 'Kerja & Kehidupan Sehari-hari', 'Work & Daily Life', 'Bali',
  '["Kamu kerja apa?","Aku kerja pakai komputer. Aku bikin aplikasi.","Wah, bagus. Kerja dari rumah?","Iya, biasanya kerja dari rumah. Kadang-kadang ke warung kopi.","Enak ya, bisa kerja dari mana aja.","Iya, enak. Tapi kadang-kadang sibuk banget. Nggak ada waktu istirahat.","Setiap hari kerja?","Nggak setiap hari. Biasanya Senin sampai Jumat. Sabtu dan Minggu aku istirahat.","Kalau istirahat, biasanya ngapain?","Biasanya aku olahraga. Aku suka latihan handstand.","Handstand? Serius?","Iya, serius. Sudah tujuh tahun aku latihan handstand.","Tujuh tahun? Wah, lama banget. Susah nggak?","Awalnya susah banget. Sekarang sudah lebih gampang. Tapi masih belajar.","Kamu latihan di mana?","Biasanya di rumah. Kadang-kadang di pantai.","Kamu juga suka acroyoga kan?","Iya, aku suka banget acroyoga. Aku latihan sama teman-teman."]'::jsonb,
  '["What do you do for work?","I work on a computer. I make apps.","Oh, nice. Work from home?","Yeah, usually work from home. Sometimes I go to a coffee shop.","Nice, being able to work from anywhere.","Yeah, it''s nice. But sometimes I''m super busy. No time to rest.","Do you work every day?","Not every day. Usually Monday to Friday. Saturday and Sunday I rest.","When you''re off, what do you usually do?","I usually exercise. I like practicing handstands.","Handstands? Seriously?","Yeah, seriously. I''ve been practicing handstands for seven years.","Seven years? Wow, that''s a really long time. Is it hard?","It was really hard at first. Now it''s easier. But I''m still learning.","Where do you practice?","Usually at home. Sometimes at the beach.","You also like acroyoga, right?","Yeah, I really love acroyoga. I practice with friends."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-2', 'kerja apa', 'what do you do (for work)', 'The standard way to ask about someone''s job', 0),
('dialog-2', 'bikin', 'to make / create', 'Casual form of membuat', 1),
('dialog-2', 'warung kopi', 'coffee shop', 'Warung = small shop or eatery; warung kopi = coffee shop', 2),
('dialog-2', 'sibuk', 'busy', null, 3),
('dialog-2', 'istirahat', 'to rest / break', null, 4),
('dialog-2', 'ngapain', 'what are you doing / what do you do', 'Very casual — from mengapa + -in', 5),
('dialog-2', 'olahraga', 'exercise / sport', null, 6),
('dialog-2', 'latihan', 'to practice / training', null, 7),
('dialog-2', 'susah', 'difficult / hard', null, 8),
('dialog-2', 'gampang', 'easy', 'Casual synonym of mudah', 9);

-- ============================================================
-- Dialogue 3: Food & Ordering
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-3', 'Dialog 3: Makanan & Memesan', 'Dialogue 3: Food & Ordering', 'Makanan & Memesan', 'Food & Ordering', 'Bali',
  '["Oh iya, kamu sudah makan belum?","Belum. Aku lapar banget sebenarnya.","Mau makan di mana? Ada warung enak di dekat sini.","Ayo, aku mau. Warung apa?","Warung nasi campur. Enak banget dan murah.","Oke, ayo kita jalan ke sana.","*(di warung)*","Pesan nasi campur satu ya.","Aku juga. Pesan nasi campur satu. Sama es teh.","Minta nggak pedas ya.","Aku suka pedas. Tambah sambal ya.","Minumnya apa?","Es jeruk satu ya.","Berapa totalnya?","Bisa bayar pakai QRIS?","Bisa transfer juga.","Oke, aku transfer ya. Makasih.","*(makanan datang)*","Wah, enak banget ini.","Iya kan? Aku sering makan di sini. Hampir setiap minggu.","Ayamnya enak. Sayurnya juga enak.","Kamu suka masak sendiri juga?","Kadang-kadang. Tapi biasanya aku pesan makanan atau makan di warung. Masak sendiri butuh waktu.","Iya, betul. Kalau sibuk, lebih gampang pesan aja.","Kamu biasanya masak apa?","Nasi goreng. Mie goreng. Yang gampang-gampang aja.","Aku juga suka nasi goreng. Tambah telur.","Iya, harus ada telur. Sama kecap manis."]'::jsonb,
  '["Oh right, have you eaten yet?","Not yet. I''m actually super hungry.","Where do you wanna eat? There''s a good warung nearby.","Let''s go, I''m in. What kind of warung?","A nasi campur place. Really good and cheap.","Okay, let''s walk over there.","*(at the warung)*","I''ll have one nasi campur please.","Me too. One nasi campur. And an iced tea.","Not spicy for me please.","I like spicy. Extra sambal please.","What would you like to drink?","One iced orange juice please.","What''s the total?","Can I pay with QRIS?","You can also do a bank transfer.","Okay, I''ll transfer. Thanks.","*(the food arrives)*","Wow, this is so good.","Right? I eat here a lot. Almost every week.","The chicken is good. The vegetables are good too.","Do you like to cook too?","Sometimes. But usually I order food or eat at a warung. Cooking takes time.","Yeah, true. When you''re busy, it''s easier to just order.","What do you usually cook?","Fried rice. Fried noodles. Just easy stuff.","I also love fried rice. With an egg on top.","Yeah, you gotta have the egg. And sweet soy sauce."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-3', 'sudah makan belum', 'have you eaten yet', 'A very common Indonesian greeting / conversation starter', 0),
('dialog-3', 'lapar', 'hungry', null, 1),
('dialog-3', 'nasi campur', 'mixed rice', 'Rice with assorted side dishes — a Balinese staple', 2),
('dialog-3', 'pedas', 'spicy', null, 3),
('dialog-3', 'sambal', 'chili sauce / paste', 'Indonesian spicy condiment — many regional varieties', 4),
('dialog-3', 'pesan', 'to order', null, 5),
('dialog-3', 'transfer', 'bank transfer', 'Very common payment method in Indonesia', 6),
('dialog-3', 'masak', 'to cook', null, 7),
('dialog-3', 'nasi goreng', 'fried rice', 'Indonesia''s most famous dish', 8),
('dialog-3', 'kecap manis', 'sweet soy sauce', 'A thick, sweet soy sauce essential in Indonesian cooking', 9),
('dialog-3', 'telur', 'egg', null, 10),
('dialog-3', 'murah', 'cheap / affordable', null, 11);

-- ============================================================
-- Dialogue 4: Getting Around & Transport
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-4', 'Dialog 4: Transportasi', 'Dialogue 4: Getting Around & Transport', 'Transportasi & Jalan-jalan', 'Getting Around & Transport', 'Bali',
  '["Kamu ke sini naik apa?","Aku naik motor.","Punya motor sendiri?","Iya, aku sewa motor. Bayar per bulan.","Berapa harganya per bulan?","Sekitar delapan ratus ribu. Nggak mahal.","Bensinnya mahal nggak?","Nggak terlalu mahal. Aku isi bensin seminggu sekali.","Kamu suka bawa motor di Bali?","Suka banget. Bisa ke mana aja. Tapi macet sih kadang-kadang.","Iya, macet di Canggu parah banget sekarang.","Iya, terutama sore hari. Kalau bisa, aku pergi pagi. Sebelum macet.","Kamu pakai helm kan?","Pasti. Harus pakai helm. Bahaya kalau nggak pakai.","Betul. Banyak orang nggak pakai helm. Bahaya banget.","Kamu pernah jatuh dari motor?","Pernah, sekali. Waktu hujan. Jalannya basah dan licin.","Aduh, sakit nggak?","Agak sakit. Tapi nggak apa-apa. Cuma luka kecil."]'::jsonb,
  '["How did you get here? What did you ride?","I rode a motorbike.","Do you have your own motorbike?","Yeah, I rent a motorbike. Pay monthly.","How much is it per month?","About eight hundred thousand. Not expensive.","Is gas expensive?","Not too expensive. I fill up once a week.","Do you like riding a motorbike in Bali?","Love it. You can go anywhere. But there''s traffic sometimes.","Yeah, traffic in Canggu is really bad now.","Yeah, especially in the afternoon. If I can, I go in the morning. Before the traffic.","You wear a helmet, right?","Of course. You have to wear a helmet. It''s dangerous if you don''t.","True. A lot of people don''t wear helmets. Really dangerous.","Have you ever fallen off a motorbike?","Yeah, once. When it was raining. The road was wet and slippery.","Ouch, did it hurt?","A bit. But it was fine. Just a small wound."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-4', 'naik', 'to ride / to take (transport)', 'Naik motor = ride a motorbike; naik bus = take a bus', 0),
('dialog-4', 'motor', 'motorbike / scooter', 'The main way to get around in Bali', 1),
('dialog-4', 'bensin', 'gasoline / petrol', null, 2),
('dialog-4', 'macet', 'traffic jam / stuck in traffic', 'One of the most useful words in Bali!', 3),
('dialog-4', 'parah', 'severe / terrible / awful', 'Very common intensifier in casual speech', 4),
('dialog-4', 'terutama', 'especially', null, 5),
('dialog-4', 'helm', 'helmet', null, 6),
('dialog-4', 'bahaya', 'dangerous / danger', null, 7),
('dialog-4', 'jatuh', 'to fall', null, 8),
('dialog-4', 'licin', 'slippery', null, 9),
('dialog-4', 'luka', 'wound / injury', null, 10);

-- ============================================================
-- Dialogue 5: Weather & Nature
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-5', 'Dialog 5: Cuaca & Alam', 'Dialogue 5: Weather & Nature', 'Cuaca & Alam', 'Weather & Nature', 'Bali',
  '["Ngomong-ngomong soal hujan, musim hujan sekarang ya?","Iya, sering hujan sore. Kadang-kadang hujan besar banget.","Aku selalu bawa payung sekarang.","Aku juga. Kalau nggak bawa payung, pasti basah.","Tapi setelah hujan, udaranya enak ya. Dingin sedikit.","Iya, segar. Nggak panas. Aku suka udara setelah hujan.","Kamu lebih suka musim panas atau musim hujan?","Aku lebih suka musim kering. Karena bisa ke pantai setiap hari.","Kalau musim hujan, ombaknya besar nggak?","Iya, ombaknya besar banget. Banyak orang surfing waktu musim hujan.","Kamu bisa surfing?","Belum bisa. Aku mau coba tapi belum sempat.","Coba aja. Ada banyak tempat belajar surfing di Canggu.","Iya, mungkin nanti aku coba. Kalau ada waktu.","Satu masalah waktu hujan: nyamuk banyak banget.","Iya, banyak banget. Aku pakai obat nyamuk setiap malam.","Aku juga. Kalau nggak pakai, nggak bisa tidur."]'::jsonb,
  '["Speaking of rain, it''s rainy season now, right?","Yeah, it rains a lot in the afternoon. Sometimes it rains really hard.","I always carry an umbrella now.","Me too. If you don''t bring an umbrella, you''ll definitely get soaked.","But after the rain, the air feels nice, right? A little cool.","Yeah, refreshing. Not hot. I love the air after it rains.","Do you prefer the hot season or the rainy season?","I prefer the dry season. Because I can go to the beach every day.","During rainy season, are the waves big?","Yeah, the waves are really big. A lot of people surf during rainy season.","Can you surf?","Not yet. I want to try but I haven''t had the chance.","Just try it. There are lots of places to learn surfing in Canggu.","Yeah, maybe I''ll try sometime. If I have time.","One problem when it rains: so many mosquitoes.","Yeah, so many. I use mosquito repellent every night.","Me too. If I don''t use it, I can''t sleep."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-5', 'ngomong-ngomong', 'speaking of / by the way', 'Casual way to change topic or bring something up', 0),
('dialog-5', 'musim hujan', 'rainy season', 'Usually October to March in Bali', 1),
('dialog-5', 'payung', 'umbrella', null, 2),
('dialog-5', 'basah', 'wet / soaked', null, 3),
('dialog-5', 'segar', 'fresh / refreshing', null, 4),
('dialog-5', 'musim kering', 'dry season', 'Usually April to September in Bali', 5),
('dialog-5', 'ombak', 'waves', null, 6),
('dialog-5', 'belum sempat', 'haven''t had the chance yet', 'Sempat = to have time/opportunity to do something', 7),
('dialog-5', 'nyamuk', 'mosquito', null, 8),
('dialog-5', 'obat nyamuk', 'mosquito repellent', 'Literally "mosquito medicine"', 9);
-- ============================================================
-- Dialogue 6: Belajar Bahasa Indonesia (Learning Indonesian)
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-6', 'Dialog 6: Belajar Bahasa Indonesia', 'Dialogue 6: Learning Indonesian', 'Belajar Bahasa Indonesia', 'Learning Indonesian', 'Bali',
  '["Oh iya, bahasa Indonesiamu sudah bagus ya.","Ah, belum bagus. Masih belajar. Masih banyak yang nggak ngerti.","Tapi kamu sudah bisa ngomong lumayan lancar.","Makasih. Aku coba latihan setiap hari. Tapi aku butuh lebih banyak latihan bicara.","Kamu belajar dari mana? Dari kursus?","Nggak, aku belajar sendiri. Dari internet. Sama dari ngomong sama orang di sini.","Wah, hebat. Belajar sendiri itu susah.","Iya, kadang-kadang susah. Yang paling susah itu mendengar. Orang bicara cepat banget.","Iya sih, orang Bali ngomong cepat.","Terus banyak kata yang aku belum tahu. Kalau aku nggak tahu satu kata, aku bingung.","Nggak apa-apa. Pelan-pelan aja. Yang penting coba terus.","Iya, aku percaya kalau coba terus, pasti bisa.","Kamu tahu bahasa Bali juga?","Sedikit. Bahasa Bali beda ya sama bahasa Indonesia?","Beda banget. Tapi nggak usah belajar bahasa Bali dulu. Bahasa Indonesia dulu aja.","Iya, betul. Satu bahasa dulu sudah cukup.","Kalau kamu nggak ngerti sesuatu, tanya aja ya. Aku bantu.","Makasih, itu sangat membantu. Oh iya, apa artinya \"sengaja\"?","Sengaja itu artinya kamu memang mau melakukan itu. Bukan kecelakaan. Misalnya, \"Aku sengaja datang pagi.\"","Oh, aku ngerti sekarang. Makasih."]'::jsonb,
  '["Oh right, your Indonesian is already good, huh.","Ah, not good yet. Still learning. Still a lot I don''t understand.","But you can already speak pretty fluently.","Thanks. I try to practice every day. But I need more speaking practice.","Where did you learn? From a course?","No, I learned on my own. From the internet. And from talking to people here.","Wow, that''s impressive. Learning on your own is hard.","Yeah, sometimes it''s hard. The hardest part is listening. People speak so fast.","Yeah, Balinese people do talk fast.","And there are a lot of words I don''t know yet. If I don''t know one word, I get confused.","It''s okay. Take it slow. The important thing is to keep trying.","Yeah, I believe if you keep trying, you''ll definitely get it.","Do you know Balinese too?","A little. Balinese is different from Indonesian, right?","Very different. But no need to learn Balinese yet. Just Indonesian first.","Yeah, true. One language at a time is enough.","If you don''t understand something, just ask, okay? I''ll help.","Thanks, that really helps. Oh right, what does \"sengaja\" mean?","Sengaja means you actually wanted to do it. Not an accident. For example, \"I came early on purpose.\"","Oh, I get it now. Thanks."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-6', 'ngerti', 'to understand', 'Casual form of mengerti', 0),
('dialog-6', 'ngomong', 'to speak / talk', 'Casual form of berbicara/bicara', 1),
('dialog-6', 'lancar', 'fluent / smooth', null, 2),
('dialog-6', 'latihan', 'practice / training', 'Can be a noun or verb (berlatih)', 3),
('dialog-6', 'kursus', 'course / class', 'Usually a non-formal or private course', 4),
('dialog-6', 'mendengar', 'to listen / hear', null, 5),
('dialog-6', 'bingung', 'confused', null, 6),
('dialog-6', 'pelan-pelan', 'slowly / take it easy', 'Reduplication of pelan for emphasis', 7),
('dialog-6', 'nggak usah', 'no need to / don''t bother', 'Casual version of tidak usah', 8),
('dialog-6', 'sengaja', 'on purpose / intentionally', 'Opposite of tidak sengaja (accidentally)', 9),
('dialog-6', 'kecelakaan', 'accident', 'From celaka (unlucky) + ke-...-an', 10);


-- ============================================================
-- Dialogue 7: Belanja & Harga (Shopping & Prices)
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-7', 'Dialog 7: Belanja & Harga', 'Dialogue 7: Shopping & Prices', 'Belanja & Harga', 'Shopping & Prices', 'Bali',
  '["Eh, kamu tahu toko bagus untuk beli baju di dekat sini?","Ada di pasar. Banyak pilihan dan lebih murah.","Di pasar yang mana?","Yang dekat perempatan besar. Kamu tahu kan?","Oh, yang itu. Aku pernah ke sana. Ramai banget.","Iya, ramai. Tapi harga di sana bisa kurang. Bisa tawar.","Aku nggak jago tawar sih. Biasanya aku bayar harga pertama.","Jangan! Harus tawar dulu. Bilang \"Bisa kurang?\" atau \"Mahal banget, bisa lebih murah?\"","Oke, aku coba lain kali.","Yang penting, jangan malu. Semua orang tawar di pasar. Itu biasa.","Kalau di toko, bisa tawar juga?","Di toko biasanya nggak bisa. Harganya sudah tetap. Tapi di pasar bisa.","Aku butuh baju baru sih. Baju aku sudah lama semua.","Yuk, kapan-kapan kita ke pasar bareng.","Mau. Mungkin besok? Atau lusa?","Besok bisa. Pagi ya, sebelum panas.","Oke, besok pagi. Jam berapa?","Jam sembilan gimana?","Siap. Jam sembilan."]'::jsonb,
  '["Hey, do you know a good shop to buy clothes near here?","There''s one at the market. Lots of choices and cheaper.","Which market?","The one near the big intersection. You know it, right?","Oh, that one. I''ve been there before. Super crowded.","Yeah, crowded. But the prices there can go down. You can bargain.","I''m not good at bargaining though. I usually just pay the first price.","Don''t! You have to bargain first. Say \"Can it be less?\" or \"So expensive, can it be cheaper?\"","Okay, I''ll try next time.","The important thing is, don''t be shy. Everyone bargains at the market. It''s normal.","What about in a store, can you bargain too?","In a store usually you can''t. The prices are already fixed. But at the market you can.","I do need new clothes. All my clothes are old.","Come on, let''s go to the market together sometime.","Sure. Maybe tomorrow? Or the day after?","Tomorrow works. In the morning, before it gets hot.","Okay, tomorrow morning. What time?","How about nine o''clock?","Sounds good. Nine o''clock."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-7', 'pasar', 'market', 'Traditional open-air market', 0),
('dialog-7', 'pilihan', 'choices / options', 'From pilih (to choose) + -an', 1),
('dialog-7', 'perempatan', 'intersection / crossroads', 'From empat (four) — a four-way crossing', 2),
('dialog-7', 'tawar', 'to bargain / haggle', null, 3),
('dialog-7', 'jago', 'skilled / good at', 'Casual — jago tawar means good at bargaining', 4),
('dialog-7', 'murah', 'cheap / inexpensive', null, 5),
('dialog-7', 'mahal', 'expensive', null, 6),
('dialog-7', 'tetap', 'fixed / permanent', 'Harga tetap = fixed price', 7),
('dialog-7', 'malu', 'shy / embarrassed', null, 8),
('dialog-7', 'lusa', 'the day after tomorrow', null, 9),
('dialog-7', 'bareng', 'together', 'Casual form of bersama', 10);


-- ============================================================
-- Dialogue 8: Teman & Kehidupan Sosial (Friends, Social Life & Plans)
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-8', 'Dialog 8: Teman & Kehidupan Sosial', 'Dialogue 8: Friends, Social Life & Plans', 'Teman & Kehidupan Sosial', 'Friends, Social Life & Plans', 'Bali',
  '["Kamu punya banyak teman di Bali?","Lumayan. Ada teman dari acroyoga. Ada teman dari warung kopi juga. Macam-macam.","Teman Indonesia atau teman bule?","Dua-duanya. Tapi aku mau punya lebih banyak teman Indonesia. Supaya bisa latihan bahasa.","Iya, itu penting. Kalau ngomong sama bule, pakai bahasa Inggris terus kan?","Betul. Itu masalahnya. Aku perlu ngomong bahasa Indonesia lebih sering.","Nanti aku kenalin kamu sama teman-teman aku ya.","Wah, mau banget. Makasih.","Teman-teman aku sering kumpul di pantai sore hari. Mau ikut?","Mau! Kapan?","Biasanya Jumat sore. Sambil nonton matahari terbenam.","Kedengarannya bagus banget.","Kamu bisa bawa teman juga kalau mau.","Oke, mungkin aku ajak pacar aku. Namanya Jessica.","Oh, kamu punya pacar? Dia dari mana?","Dia juga tinggal di Bali sekarang.","Wah, asik. Dia suka Bali juga?","Suka banget. Dia juga suka olahraga. Kita sering latihan bareng.","Bagus. Ajak dia Jumat ya.","Siap, pasti."]'::jsonb,
  '["Do you have a lot of friends in Bali?","A fair amount. I have friends from acroyoga. Friends from the coffee shop too. All kinds.","Indonesian friends or foreigner friends?","Both. But I want to have more Indonesian friends. So I can practice the language.","Yeah, that''s important. When you talk to foreigners, you always use English, right?","Exactly. That''s the problem. I need to speak Indonesian more often.","I''ll introduce you to my friends later, okay?","Oh wow, I''d love that. Thanks.","My friends often hang out at the beach in the afternoon. Wanna come?","Sure! When?","Usually Friday afternoon. While watching the sunset.","That sounds really great.","You can bring a friend too if you want.","Okay, maybe I''ll bring my girlfriend. Her name is Jessica.","Oh, you have a girlfriend? Where is she from?","She also lives in Bali now.","Oh cool. Does she like Bali too?","Loves it. She also likes sports. We often train together.","Nice. Bring her on Friday, okay?","For sure, definitely."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-8', 'bule', 'foreigner (usually Western)', 'Informal, very common in daily speech', 0),
('dialog-8', 'macam-macam', 'all kinds / various', 'Reduplication of macam (type/kind)', 1),
('dialog-8', 'supaya', 'so that / in order to', null, 2),
('dialog-8', 'kenalin', 'to introduce (someone)', 'Casual form of kenalkan — kenal + -in suffix', 3),
('dialog-8', 'kumpul', 'to gather / hang out', null, 4),
('dialog-8', 'matahari terbenam', 'sunset', 'Literally: sun that has set', 5),
('dialog-8', 'kedengarannya', 'it sounds like', 'From dengar (hear) + ke-...-an + -nya', 6),
('dialog-8', 'ajak', 'to invite / bring along', null, 7),
('dialog-8', 'pacar', 'boyfriend / girlfriend', null, 8),
('dialog-8', 'asik', 'cool / fun / awesome', 'Casual expression of enthusiasm', 9);


-- ============================================================
-- Dialogue 9: Kesehatan & Tubuh (Health & Body)
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-9', 'Dialog 9: Kesehatan & Tubuh', 'Dialogue 9: Health & Body', 'Kesehatan & Tubuh', 'Health & Body', 'Bali',
  '["Eh, kamu kelihatan capek hari ini. Nggak apa-apa?","Iya, agak capek. Kemarin latihan terlalu keras. Badan aku pegal semua.","Punggung aku juga sakit sedikit.","Aduh, hati-hati. Jangan latihan terlalu keras.","Iya, aku tahu. Harusnya aku istirahat lebih banyak kemarin.","Kamu sudah minum obat?","Belum. Nggak terlalu sakit sih. Cuma pegal.","Kalau masih sakit besok, pergi ke dokter ya.","Iya, mungkin. Atau aku beli obat di apotek dulu.","Ada apotek dekat sini. Di sebelah toko itu.","Oh iya, aku tahu. Aku pernah beli obat di sana.","Kamu pernah sakit parah di Bali?","Pernah, sekali. Demam tinggi. Pusing. Mual juga.","Demam berdarah?","Nggak, bukan demam berdarah. Mungkin masuk angin aja. Tiga hari aku di tempat tidur.","Wah, kasihan. Sudah sembuh sekarang kan?","Sudah, sudah sembuh. Sekarang aku lebih hati-hati. Banyak minum air. Banyak istirahat.","Itu penting. Cuaca di Bali panas. Harus banyak minum.","Betul. Dan pakai obat nyamuk. Supaya nggak digigit nyamuk.","Iya, nyamuk di Bali banyak banget. Terutama waktu musim hujan.","Kulit aku gatal banget kalau digigit nyamuk.","Sama. Aku juga. Bengkak dan gatal."]'::jsonb,
  '["Hey, you look tired today. Are you okay?","Yeah, kinda tired. I trained too hard yesterday. My whole body is sore.","My back hurts a little too.","Ouch, be careful. Don''t train too hard.","Yeah, I know. I should have rested more yesterday.","Have you taken any medicine?","Not yet. It doesn''t really hurt that much. Just sore.","If it still hurts tomorrow, go see a doctor, okay?","Yeah, maybe. Or I''ll buy medicine at the pharmacy first.","There''s a pharmacy nearby. Next to that shop.","Oh right, I know. I''ve bought medicine there before.","Have you ever been seriously sick in Bali?","Once, yeah. High fever. Dizzy. Nauseous too.","Dengue fever?","No, not dengue. Probably just masuk angin. I was in bed for three days.","Aw, that sucks. You''re better now though, right?","Yeah, all better. Now I''m more careful. Drink lots of water. Rest a lot.","That''s important. The weather in Bali is hot. You have to drink a lot.","True. And use mosquito repellent. So you don''t get bitten by mosquitoes.","Yeah, there are so many mosquitoes in Bali. Especially during rainy season.","My skin gets super itchy when I get bitten by mosquitoes.","Same. Me too. Swollen and itchy."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-9', 'capek', 'tired', 'Also spelled capai — very common casual word', 0),
('dialog-9', 'pegal', 'sore / achy (muscles)', 'That stiff, achy feeling after exercise', 1),
('dialog-9', 'punggung', 'back (body part)', null, 2),
('dialog-9', 'istirahat', 'to rest', null, 3),
('dialog-9', 'obat', 'medicine / medication', null, 4),
('dialog-9', 'apotek', 'pharmacy', null, 5),
('dialog-9', 'demam', 'fever', 'Demam berdarah = dengue fever', 6),
('dialog-9', 'masuk angin', 'feeling under the weather', 'Indonesian concept — literally "wind entered the body"', 7),
('dialog-9', 'sembuh', 'recovered / healed', null, 8),
('dialog-9', 'nyamuk', 'mosquito', null, 9),
('dialog-9', 'digigit', 'to be bitten', 'Passive of gigit (to bite) — di- prefix', 10),
('dialog-9', 'gatal', 'itchy', null, 11);


-- ============================================================
-- Dialogue 10: Rumah & Lingkungan (Home & Neighborhood)
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-10', 'Dialog 10: Rumah & Lingkungan', 'Dialogue 10: Home & Neighborhood', 'Rumah & Lingkungan', 'Home & Neighborhood', 'Bali',
  '["Ngomong-ngomong, gimana villa kamu? Nyaman?","Lumayan nyaman. Tapi ada masalah sedikit.","Masalah apa?","AC-nya rusak minggu lalu. Panas banget di kamar.","Sudah diperbaiki belum?","Belum. Aku sudah telepon tukang, tapi dia belum datang.","Coba telepon lagi. Bilang \"Kapan bisa datang?\"","Iya, aku mau telepon lagi nanti.","Terus, listrik di tempat kamu sering mati nggak?","Kadang-kadang. Kalau hujan besar, listrik sering mati.","Sama di tempat aku juga. Kesal banget.","Aku selalu siap-siap. Ada senter di kamar.","Oh, pintar. Aku juga harus beli senter.","Air di villa kamu bagus?","Airnya bersih. Tapi untuk minum, aku beli air galon.","Iya, jangan minum air keran. Nggak aman.","Tetangga kamu baik?","Tetangga aku baik banget. Mereka orang Bali. Sering kasih makanan.","Wah, enak. Orang Bali memang ramah.","Iya, sangat ramah. Kadang-kadang tetangga aku kasih buah dari kebun.","Pernah diundang ke upacara di pura?","Pernah, sekali. Bagus banget. Banyak orang. Banyak makanan.","Itu namanya \"Odalan.\" Sering ada di Bali.","Aku suka budaya Bali. Sangat menarik."]'::jsonb,
  '["By the way, how''s your villa? Comfortable?","Pretty comfortable. But there''s a small problem.","What problem?","The AC broke last week. It''s so hot in the room.","Has it been fixed yet?","Not yet. I already called a repairman, but he hasn''t come.","Try calling again. Say \"When can you come?\"","Yeah, I''ll call again later.","Also, does the electricity at your place go out often?","Sometimes. When there''s heavy rain, the electricity often goes out.","Same at my place. So annoying.","I always prepare. I have a flashlight in the room.","Oh, smart. I should buy a flashlight too.","Is the water at your villa good?","The water is clean. But for drinking, I buy gallon water.","Yeah, don''t drink tap water. It''s not safe.","Are your neighbors nice?","My neighbors are really nice. They''re Balinese. They often give me food.","Oh nice. Balinese people are really friendly.","Yeah, very friendly. Sometimes my neighbors give me fruit from their garden.","Have you ever been invited to a ceremony at a temple?","Once, yeah. It was so beautiful. Lots of people. Lots of food.","That''s called \"Odalan.\" It happens a lot in Bali.","I love Balinese culture. It''s really fascinating."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-10', 'nyaman', 'comfortable', null, 0),
('dialog-10', 'rusak', 'broken / damaged', null, 1),
('dialog-10', 'diperbaiki', 'to be repaired / fixed', 'Passive of perbaiki — di- prefix', 2),
('dialog-10', 'tukang', 'repairman / handyman', 'Tukang + noun = person who does that thing', 3),
('dialog-10', 'listrik', 'electricity', 'Listrik mati = power outage', 4),
('dialog-10', 'senter', 'flashlight', null, 5),
('dialog-10', 'air keran', 'tap water', 'Keran = faucet/tap', 6),
('dialog-10', 'tetangga', 'neighbor', null, 7),
('dialog-10', 'kebun', 'garden / plantation', null, 8),
('dialog-10', 'diundang', 'to be invited', 'Passive of undang (to invite) — di- prefix', 9),
('dialog-10', 'upacara', 'ceremony', null, 10),
('dialog-10', 'pura', 'Balinese Hindu temple', 'Specifically a Balinese temple, not a mosque or church', 11);
-- ============================================================
-- Dialogue 11: Travel & Experiences
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-11', 'Dialog 11: Perjalanan & Pengalaman', 'Dialogue 11: Travel & Experiences', 'Perjalanan & Pengalaman', 'Travel & Experiences', 'Bali',
  '["Kamu sudah ke mana aja di Indonesia? Selain Bali?","Aku sudah pernah ke Lombok dan ke Yogyakarta.","Lombok bagus ya?","Bagus banget. Pantainya lebih sepi daripada Bali. Airnya bersih. Ombaknya besar.","Kamu suka Lombok atau Bali?","Dua-duanya bagus. Tapi Bali lebih mudah. Lebih banyak pilihan makanan, tempat tinggal, semuanya.","Lombok lebih murah daripada Bali?","Iya, lebih murah. Makanan lebih murah. Sewa juga lebih murah.","Yogyakarta gimana?","Yogyakarta seru banget. Banyak sejarah. Banyak budaya. Makanannya enak.","Kamu pergi ke sana naik pesawat?","Iya, naik pesawat. Dari Bali ke Yogya sekitar satu setengah jam.","Cepat ya.","Iya, cepat. Dan tiketnya nggak terlalu mahal kalau pesan lebih awal.","Aku mau ke Yogya juga. Tapi belum tahu kapan.","Kalau kamu pergi, harus coba gudeg. Makanan khas Yogya. Manis banget tapi enak.","Aku suka makanan manis. Pasti aku coba.","Kamu pernah ke luar Indonesia?","Belum pernah ke luar Indonesia. Tapi aku mau ke Australia. Teman aku ada di sana.","Australia mahal banget sih.","Iya, aku tahu. Makanya aku harus nabung dulu.","Berapa lama kamu mau di sana?","Mungkin dua minggu. Nggak lama.","Dua minggu cukup untuk lihat banyak tempat.","Iya, aku harap begitu."]'::jsonb,
  '["Where have you been in Indonesia? Besides Bali?","I''ve been to Lombok and Yogyakarta.","Lombok is nice, right?","Really nice. The beaches are quieter than Bali. The water is clean. The waves are big.","Do you prefer Lombok or Bali?","They''re both great. But Bali is easier. More food options, places to stay, everything.","Is Lombok cheaper than Bali?","Yeah, cheaper. Food is cheaper. Rent is cheaper too.","How about Yogyakarta?","Yogyakarta is super fun. Lots of history. Lots of culture. The food is great.","Did you fly there?","Yeah, flew. From Bali to Yogya it''s about one and a half hours.","That''s fast.","Yeah, fast. And the tickets aren''t too expensive if you book early.","I wanna go to Yogya too. But I don''t know when yet.","If you go, you have to try gudeg. A Yogya specialty. Super sweet but delicious.","I like sweet food. I''ll definitely try it.","Have you been outside of Indonesia?","I haven''t been outside Indonesia yet. But I want to go to Australia. I have a friend there.","Australia is super expensive though.","Yeah, I know. That''s why I have to save up first.","How long do you want to stay there?","Maybe two weeks. Not long.","Two weeks is enough to see a lot of places.","Yeah, I hope so."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-11', 'pernah', 'ever / have (done something)', 'Sudah pernah = have already done; belum pernah = have never done', 0),
('dialog-11', 'sepi', 'quiet / empty / not crowded', 'Opposite of ramai', 1),
('dialog-11', 'ombak', 'wave(s)', 'Ocean waves — useful for beach/surf talk', 2),
('dialog-11', 'dua-duanya', 'both (of them)', 'From dua (two) — a handy way to say "both"', 3),
('dialog-11', 'pilihan', 'choice / option', 'From pilih (to choose)', 4),
('dialog-11', 'sejarah', 'history', null, 5),
('dialog-11', 'budaya', 'culture', null, 6),
('dialog-11', 'pesawat', 'airplane', 'Short for pesawat terbang', 7),
('dialog-11', 'khas', 'typical / characteristic / specialty', 'Makanan khas = local specialty food', 8),
('dialog-11', 'nabung', 'to save (money)', 'Casual form of menabung', 9),
('dialog-11', 'harap', 'to hope', null, 10);

-- ============================================================
-- Dialogue 12: Describing Life in Bali
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-12', 'Dialog 12: Hidup di Bali', 'Dialogue 12: Describing Life in Bali', 'Hidup di Bali', 'Describing Life in Bali', 'Bali',
  '["Aku mau tanya, kamu suka apa tentang hidup di Bali?","Banyak hal yang aku suka. Cuacanya bagus hampir setiap hari.","Apa lagi?","Orang-orangnya ramah. Makanannya murah dan enak. Alamnya indah. Sawah, pantai, semuanya dekat.","Ada yang nggak kamu suka?","Hmm, macetnya. Macet di Bali sekarang parah banget. Terutama di Canggu dan Seminyak.","Iya, betul. Makin tahun makin macet.","Terus, sampah juga. Banyak sampah di jalan dan di pantai. Sedih lihatnya.","Iya, itu masalah besar di Bali.","Tapi secara keseluruhan, aku sangat senang tinggal di sini. Hidupku di sini lebih santai daripada di Romania.","Di Romania sibuk banget ya?","Iya, lebih sibuk. Lebih dingin juga. Di sini aku bisa olahraga di luar setiap hari.","Kamu nggak kangen keluarga?","Kadang-kadang kangen. Tapi aku pulang ke Romania setahun sekali. Biasanya waktu Natal.","Itu bagus. Penting ketemu keluarga.","Iya, pasti. Keluarga penting banget.","Kamu mau tinggal di Bali selamanya?","Nggak tahu. Mungkin. Tergantung banyak hal. Sekarang aku senang di sini."]'::jsonb,
  '["I wanna ask, what do you like about living in Bali?","There''s a lot I like. The weather is nice almost every day.","What else?","The people are friendly. The food is cheap and good. The nature is beautiful. Rice fields, beaches, everything is close.","Is there anything you don''t like?","Hmm, the traffic. Traffic in Bali is really terrible now. Especially in Canggu and Seminyak.","Yeah, that''s true. It gets worse every year.","Also, the trash. There''s a lot of trash on the streets and on the beaches. It''s sad to see.","Yeah, that''s a big problem in Bali.","But overall, I''m really happy living here. My life here is more relaxed than in Romania.","Is it really busy in Romania?","Yeah, busier. Colder too. Here I can exercise outside every day.","Don''t you miss your family?","Sometimes I miss them. But I go back to Romania once a year. Usually around Christmas.","That''s good. It''s important to see family.","Yeah, for sure. Family is super important.","Do you want to live in Bali forever?","I don''t know. Maybe. It depends on a lot of things. Right now I''m happy here."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-12', 'cuaca', 'weather', null, 0),
('dialog-12', 'alam', 'nature', null, 1),
('dialog-12', 'indah', 'beautiful', 'Used for scenery, nature, views', 2),
('dialog-12', 'ramah', 'friendly / welcoming', null, 3),
('dialog-12', 'sampah', 'trash / garbage / litter', null, 4),
('dialog-12', 'sedih', 'sad', null, 5),
('dialog-12', 'masalah', 'problem / issue', null, 6),
('dialog-12', 'secara keseluruhan', 'overall / on the whole', null, 7),
('dialog-12', 'santai', 'relaxed / chill / easygoing', 'One of the most-used words in Bali', 8),
('dialog-12', 'kangen', 'to miss (someone/something)', null, 9),
('dialog-12', 'selamanya', 'forever', 'From selama (during) + -nya', 10),
('dialog-12', 'tergantung', 'it depends', 'Very useful in conversation', 11);

-- ============================================================
-- Dialogue 13: Errands & Practical Stuff
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-13', 'Dialog 13: Urusan Sehari-hari', 'Dialogue 13: Errands & Practical Stuff', 'Urusan Sehari-hari', 'Errands & Practical Stuff', 'Bali',
  '["Eh, aku harus ke toko dulu sebentar. Mau ikut?","Mau beli apa?","Aku butuh beli sabun, air minum, sama charger HP baru. Charger aku rusak.","Oh, HP kamu apa?","iPhone. Charger-nya beda dari yang lain.","Iya, harus cari yang khusus. Mungkin ada di toko dekat perempatan.","Oke, ayo kita cari di sana.","*(di toko)*","Permisi, ada charger iPhone?","Yang mana? Yang panjang atau yang pendek?","Yang panjang. Berapa harganya?","Lima puluh ribu.","Oke, aku ambil. Sama air galon satu ya.","Mau pakai kantong plastik?","Nggak usah, makasih. Aku bawa tas sendiri.","Totalnya seratus ribu ya.","Oke, ini uangnya. Makasih ya.","Sama-sama.","*(keluar dari toko)*","Oh, aku juga harus isi bensin. Ada SPBU dekat sini?","Ada, lurus terus, belok kanan setelah perempatan.","Oke, sebentar ya. Nggak lama.","Santai, aku tunggu di sini."]'::jsonb,
  '["Hey, I gotta go to the store real quick. Wanna come?","What do you need to buy?","I need to buy soap, drinking water, and a new phone charger. My charger is broken.","Oh, what phone do you have?","iPhone. The charger is different from the others.","Yeah, you have to find a special one. Maybe they have it at the store near the intersection.","Okay, let''s check there.","*(at the store)*","Excuse me, do you have an iPhone charger?","Which one? The long one or the short one?","The long one. How much is it?","Fifty thousand.","Okay, I''ll take it. And one water gallon too please.","Do you want a plastic bag?","No thanks. I brought my own bag.","The total is a hundred thousand.","Okay, here''s the money. Thanks.","You''re welcome.","*(leaving the store)*","Oh, I also need to fill up on gas. Is there a gas station nearby?","Yeah, go straight, turn right after the intersection.","Okay, one sec. Won''t be long.","No rush, I''ll wait here."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-13', 'toko', 'store / shop', null, 0),
('dialog-13', 'sebentar', 'a moment / real quick', null, 1),
('dialog-13', 'rusak', 'broken / damaged', null, 2),
('dialog-13', 'khusus', 'special / specific', null, 3),
('dialog-13', 'perempatan', 'intersection / crossroads', 'From empat (four) — a four-way junction', 4),
('dialog-13', 'permisi', 'excuse me', 'Polite way to get attention or pass by someone', 5),
('dialog-13', 'kantong plastik', 'plastic bag', null, 6),
('dialog-13', 'SPBU', 'gas station', 'Stands for Stasiun Pengisian Bahan Bakar Umum', 7),
('dialog-13', 'lurus', 'straight (ahead)', 'For giving directions', 8),
('dialog-13', 'belok', 'to turn', 'Belok kanan = turn right; belok kiri = turn left', 9);

-- ============================================================
-- Dialogue 14: Evening Plans & Going Out
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-14', 'Dialog 14: Rencana Malam', 'Dialogue 14: Evening Plans & Going Out', 'Rencana Malam', 'Evening Plans & Going Out', 'Bali',
  '["Nanti malam kamu ada acara?","Belum ada rencana. Kenapa?","Teman aku punya acara kecil di rumahnya. Mau datang?","Acara apa?","Kumpul biasa aja. Makan bareng, ngobrol, dengerin musik.","Kedengarannya enak. Jam berapa mulai?","Mulai jam tujuh malam. Tapi santai, datang kapan aja boleh.","Di mana rumahnya?","Di belakang warung yang tadi. Kamu tahu gang kecil itu? Masuk gang itu, rumah yang kedua di kiri.","Oh, aku tahu. Deket ya.","Iya, dekat banget. Jalan kaki aja bisa.","Aku perlu bawa apa?","Nggak usah bawa apa-apa. Tapi kalau mau bawa minuman, boleh.","Oke, aku bawa bir aja.","Siap. Sampai ketemu nanti malam ya.","Sampai nanti!"]'::jsonb,
  '["Do you have plans tonight?","No plans yet. Why?","My friend is having a small get-together at his place. Wanna come?","What kind of event?","Just a casual hangout. Eating together, chatting, listening to music.","Sounds nice. What time does it start?","Starts at seven. But it''s chill, come whenever.","Where''s his place?","Behind that warung from earlier. You know that little alley? Go into that alley, second house on the left.","Oh, I know it. It''s close, right?","Yeah, super close. You can just walk.","Do I need to bring anything?","You don''t need to bring anything. But if you want to bring drinks, that''s cool.","Okay, I''ll just bring some beer.","Sounds good. See you tonight then.","See you later!"]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-14', 'nanti malam', 'tonight / later tonight', null, 0),
('dialog-14', 'acara', 'event / plans / occasion', null, 1),
('dialog-14', 'rencana', 'plan(s)', null, 2),
('dialog-14', 'kumpul', 'to gather / hang out', 'Very common — kumpul-kumpul = casual get-together', 3),
('dialog-14', 'bareng', 'together', 'Casual form of bersama', 4),
('dialog-14', 'ngobrol', 'to chat / to talk', 'Casual and very commonly used', 5),
('dialog-14', 'kedengarannya', 'it sounds (like)', 'From dengar (to hear)', 6),
('dialog-14', 'gang', 'alley / small lane', 'Narrow side street — very common in Bali neighborhoods', 7),
('dialog-14', 'jalan kaki', 'to walk / on foot', 'Literally "foot road"', 8),
('dialog-14', 'siap', 'ready / sure / got it', 'Used as casual confirmation', 9);

-- ============================================================
-- Dialogue 15: At the Gathering
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-15', 'Dialog 15: Di Acara Kumpul', 'Dialogue 15: At the Gathering', 'Di Acara Kumpul', 'At the Gathering', 'Bali',
  '["Hei, kamu datang! Ayo masuk.","Makasih. Ini aku bawa bir.","Wah, makasih banyak. Taruh di sana ya, di meja.","Siapa aja yang datang?","Ada teman-teman dari sini. Beberapa orang yang mungkin kamu belum kenal.","Ayo, aku kenalin. Ini Wayan. Ini Made.","Halo, senang ketemu.","Halo! Kamu tinggal di mana?","Aku tinggal di Canggu. Dekat pantai.","Oh, sama! Aku juga tinggal di Canggu.","Wah, dekat dong. Kamu kerja apa?","Aku tukang surfing. Aku ngajar surfing di pantai.","Wah, keren. Aku belum bisa surfing.","Kalau mau belajar, bilang aja. Aku bisa ajar kamu.","Beneran? Mau banget!","Kapan kamu mau mulai? Minggu depan bisa?","Bisa! Hari apa?","Senin pagi gimana? Ombaknya biasanya bagus hari Senin.","Oke, siap. Senin pagi.","Aku kasih kamu nomor HP aku ya.","Oke, makasih.","*(kemudian, ngobrol dengan orang lain)*","Kamu suka musik apa?","Macam-macam. Aku suka musik yang santai. Kamu?","Aku suka dangdut.","Dangdut? Aku jarang dengar dangdut.","Harus coba dengar. Dangdut itu seru banget.","Mungkin aku nggak ngerti liriknya tapi aku coba ya.","Pelan-pelan nanti ngerti. Kayak belajar bahasa Indonesia. Pelan-pelan.","Ha ha, betul!"]'::jsonb,
  '["Hey, you made it! Come on in.","Thanks. I brought some beer.","Oh, thanks a lot. Put it over there, on the table.","Who''s here?","Some friends from around here. A few people you might not know yet.","Come on, let me introduce you. This is Wayan. This is Made.","Hi, nice to meet you.","Hi! Where do you live?","I live in Canggu. Near the beach.","Oh, same! I also live in Canggu.","Oh nice, that''s close. What do you do for work?","I''m a surf instructor. I teach surfing at the beach.","Oh, cool. I can''t surf yet.","If you want to learn, just say the word. I can teach you.","Really? I''d love that!","When do you want to start? Next week works?","Sure! What day?","How about Monday morning? The waves are usually good on Mondays.","Okay, deal. Monday morning.","I''ll give you my phone number.","Okay, thanks.","*(later, chatting with someone else)*","What kind of music do you like?","All sorts. I like chill music. You?","I like dangdut.","Dangdut? I rarely listen to dangdut.","You gotta try it. Dangdut is super fun.","Maybe I won''t understand the lyrics but I''ll give it a try.","You''ll get it little by little. Like learning Indonesian. Step by step.","Ha ha, true!"]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-15', 'taruh', 'to put / to place', null, 0),
('dialog-15', 'kenalin', 'to introduce', 'Casual form of kenalkan — from kenal (to know someone)', 1),
('dialog-15', 'tukang', 'person who does (something)', 'Tukang surfing = surfer; tukang masak = cook', 2),
('dialog-15', 'ngajar', 'to teach', 'Casual form of mengajar', 3),
('dialog-15', 'keren', 'cool / awesome', null, 4),
('dialog-15', 'beneran', 'really? / for real?', 'Casual — from benar (true)', 5),
('dialog-15', 'kasih', 'to give', 'Very common casual word', 6),
('dialog-15', 'macam-macam', 'all sorts / various kinds', 'From macam (kind/type)', 7),
('dialog-15', 'dangdut', 'dangdut (Indonesian pop music)', 'A hugely popular Indonesian music genre with distinctive rhythm', 8),
('dialog-15', 'jarang', 'rarely / seldom', null, 9),
('dialog-15', 'pelan-pelan', 'slowly / step by step / little by little', 'Very encouraging phrase — used a lot when learning something', 10);
-- ============================================================
-- Dialogue 16: Weekend Morning Routine
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-16', 'Dialog 16: Rutinitas Pagi', 'Dialogue 16: Weekend Morning Routine', 'Rutinitas Pagi', 'Weekend Morning Routine', 'Bali',
  '["*(keesokan harinya)*","Selamat pagi! Sudah bangun?","Sudah. Baru bangun. Masih ngantuk.","Kamu tidur jam berapa semalam?","Jam dua belas. Terlalu malam. Harusnya tidur lebih awal.","Aku juga tidur telat. Nanti sore pasti ngantuk lagi.","Kamu sudah mandi?","Belum. Mau minum kopi dulu.","Ayo kita ke warung kopi. Ada tempat baru yang aku mau coba.","Boleh. Tapi aku mandi dulu ya. Lima belas menit.","Oke, aku tunggu.","*(di warung kopi)*","Pesan kopi apa?","Kopi hitam satu ya. Nggak pakai gula.","Aku pesan kopi susu. Dingin. Pakai gula sedikit.","Mau pesan makanan juga?","Boleh. Ada apa di sini?","Ada roti bakar, pisang goreng, nasi goreng.","Aku pesan roti bakar satu.","Aku pesan pisang goreng. Sama roti bakar juga.","Kenyang nanti.","Nggak apa-apa, aku lapar banget pagi ini."]'::jsonb,
  '["*(the next day)*","Good morning! You up?","Yeah. Just woke up. Still sleepy.","What time did you go to sleep last night?","Midnight. Way too late. I should''ve gone to bed earlier.","I also stayed up late. I''ll definitely be sleepy again this afternoon.","Have you showered?","Not yet. I wanna have coffee first.","Let''s go to a coffee shop. There''s a new place I wanna try.","Sure. But let me shower first. Fifteen minutes.","Okay, I''ll wait.","*(at the coffee shop)*","What coffee are you ordering?","One black coffee please. No sugar.","I''ll get an iced coffee with milk. A little sugar.","Wanna order food too?","Sure. What do they have here?","They have toast, fried bananas, and fried rice.","I''ll have one toast.","I''ll get fried bananas. And toast too.","You''re gonna be so full.","That''s fine, I''m super hungry this morning."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-16', 'keesokan harinya', 'the next day', 'Formal way to say "the following day"', 0),
('dialog-16', 'ngantuk', 'sleepy', 'Very common casual word', 1),
('dialog-16', 'semalam', 'last night', null, 2),
('dialog-16', 'telat', 'late', 'Casual form of terlambat', 3),
('dialog-16', 'mandi', 'to shower / bathe', 'In Indonesia this usually means showering, not taking a bath', 4),
('dialog-16', 'kopi hitam', 'black coffee', 'Literally "black coffee" — the default at most warungs', 5),
('dialog-16', 'kopi susu', 'coffee with milk', 'Literally "milk coffee" — very popular in Bali', 6),
('dialog-16', 'roti bakar', 'toast / grilled bread', 'A popular breakfast item', 7),
('dialog-16', 'pisang goreng', 'fried banana', 'A classic Indonesian snack', 8),
('dialog-16', 'kenyang', 'full (after eating)', null, 9),
('dialog-16', 'gula', 'sugar', null, 10);

-- ============================================================
-- Dialogue 17: Making Plans & Organizing
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-17', 'Dialog 17: Bikin Rencana', 'Dialogue 17: Making Plans & Organizing', 'Bikin Rencana', 'Making Plans & Organizing', 'Bali',
  '["Oh iya, aku mau tanya. Kamu sibuk minggu depan?","Nggak terlalu sibuk. Kenapa?","Aku mau bikin acara kecil. Acroyoga di pantai. Mau ikut?","Mau! Aku nggak bisa acroyoga tapi aku mau lihat.","Nggak apa-apa, nggak usah bisa. Bisa coba. Aku ajar kamu dasar-dasarnya.","Susah nggak?","Awalnya agak susah. Tapi kalau ada yang bantu, nggak terlalu susah.","Harus kuat ya?","Nggak harus kuat banget. Yang penting percaya sama partner kamu.","Berapa orang yang datang?","Mungkin sepuluh sampai lima belas orang.","Hari apa?","Aku pikir hari Sabtu. Pagi, sebelum panas.","Jam berapa?","Jam delapan pagi gimana?","Oke, bisa. Aku datang jam delapan.","Bagus. Aku kirim lokasi lewat WhatsApp ya.","Siap. Oh, Jessica boleh ikut juga?","Boleh dong! Ajak aja.","Dia pasti senang. Dia juga mau coba acroyoga.","Bagus, semakin banyak orang semakin seru."]'::jsonb,
  '["Oh right, I wanted to ask. Are you busy next week?","Not too busy. Why?","I wanna put together a small event. Acroyoga on the beach. Wanna join?","Yes! I can''t do acroyoga but I wanna watch.","No worries, you don''t have to know how. You can try. I''ll teach you the basics.","Is it hard?","It''s a bit hard at first. But if someone helps you, it''s not too hard.","Do you have to be strong?","You don''t have to be super strong. The important thing is trusting your partner.","How many people are coming?","Maybe ten to fifteen people.","What day?","I''m thinking Saturday. Morning, before it gets hot.","What time?","How about eight in the morning?","Okay, works for me. I''ll be there at eight.","Great. I''ll send you the location on WhatsApp.","Sounds good. Oh, can Jessica come too?","Of course! Bring her along.","She''ll be stoked. She also wants to try acroyoga.","Great, the more people the more fun."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-17', 'minggu depan', 'next week', null, 0),
('dialog-17', 'bikin acara', 'to put together an event', 'Bikin = make/create (casual); acara = event', 1),
('dialog-17', 'ikut', 'to join / come along', null, 2),
('dialog-17', 'nggak usah', 'don''t need to / no need', 'Casual way to say tidak perlu', 3),
('dialog-17', 'dasar-dasarnya', 'the basics', 'Dasar = base/basic; -nya makes it "the basics"', 4),
('dialog-17', 'percaya', 'to trust / believe', null, 5),
('dialog-17', 'kirim', 'to send', null, 6),
('dialog-17', 'lewat', 'via / through', 'Lewat WhatsApp = via WhatsApp', 7),
('dialog-17', 'ajak', 'to invite / bring along', null, 8),
('dialog-17', 'semakin ... semakin', 'the more ... the more', 'A useful pattern: semakin banyak semakin seru = the more people the more fun', 9),
('dialog-17', 'seru', 'fun / exciting', 'Very common casual word for something exciting or lively', 10);

-- ============================================================
-- Dialogue 18: Talking About Money & Costs
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-18', 'Dialog 18: Uang & Biaya Hidup', 'Dialogue 18: Talking About Money & Costs', 'Uang & Biaya Hidup', 'Talking About Money & Costs', 'Bali',
  '["Eh, hidup di Bali mahal nggak menurut kamu?","Tergantung sih. Bisa murah, bisa mahal.","Gimana maksudnya?","Kalau kamu makan di warung setiap hari, murah. Tapi kalau makan di restoran bule, mahal.","Berapa kira-kira kamu habiskan per bulan?","Hmm, kira-kira... untuk sewa, makan, bensin, internet, semuanya... mungkin sekitar sepuluh sampai lima belas juta.","Itu termasuk murah ya?","Dibanding hidup di Eropa, murah banget. Tapi untuk orang Indonesia, itu banyak.","Iya, betul. Gaji di sini nggak besar.","Makanya aku nggak mau mengeluh soal harga di sini.","Kamu nabung juga?","Iya, aku coba nabung sedikit setiap bulan. Penting untuk masa depan.","Betul. Banyak orang nggak mikir soal itu.","Aku pernah rugi juga sih. Investasi yang salah.","Aduh, itu sakit.","Iya, tapi aku belajar dari kesalahan itu.","Yang penting jangan habiskan semua uang.","Betul, harus selalu sisakan sedikit."]'::jsonb,
  '["Hey, is living in Bali expensive in your opinion?","It depends. It can be cheap, it can be expensive.","What do you mean?","If you eat at warungs every day, it''s cheap. But if you eat at expat restaurants, it''s expensive.","Roughly how much do you spend per month?","Hmm, roughly... for rent, food, gas, internet, everything... maybe around ten to fifteen million.","That''s considered cheap?","Compared to living in Europe, super cheap. But for Indonesians, that''s a lot.","Yeah, true. Salaries here aren''t high.","That''s why I don''t wanna complain about prices here.","Do you save money too?","Yeah, I try to save a little every month. It''s important for the future.","True. A lot of people don''t think about that.","I''ve lost money too though. A bad investment.","Ouch, that hurts.","Yeah, but I learned from that mistake.","The important thing is don''t spend all your money.","Right, you always gotta set some aside."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-18', 'tergantung', 'it depends', 'One of the most useful words in conversation', 0),
('dialog-18', 'habiskan', 'to spend / use up', 'From habis (finished/used up) + -kan', 1),
('dialog-18', 'kira-kira', 'approximately / roughly', null, 2),
('dialog-18', 'gaji', 'salary / wages', null, 3),
('dialog-18', 'mengeluh', 'to complain', null, 4),
('dialog-18', 'nabung', 'to save money', 'Casual form of menabung', 5),
('dialog-18', 'masa depan', 'the future', 'Literally "time ahead"', 6),
('dialog-18', 'rugi', 'to lose money / a loss', null, 7),
('dialog-18', 'kesalahan', 'mistake', 'From salah (wrong) + ke-...-an', 8),
('dialog-18', 'sisakan', 'to set aside / leave some', 'From sisa (remainder) + -kan', 9);

-- ============================================================
-- Dialogue 19: Dealing with Problems
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-19', 'Dialog 19: Mengatasi Masalah', 'Dialogue 19: Dealing with Problems', 'Mengatasi Masalah', 'Dealing with Problems', 'Bali',
  '["Aduh, aku baru ingat. Aku ketinggalan dompet di warung tadi!","Serius? Ayo balik sekarang!","Iya, ayo cepat.","*(di warung)*","Permisi, tadi aku makan di sini. Aku ketinggalan dompet. Ada yang lihat?","Oh, ini ya? Ada dompet di bawah meja.","Iya, itu dompet aku! Makasih banyak ya. Aduh, lega banget.","Sama-sama. Hati-hati ya lain kali.","Iya, aku harus lebih hati-hati. Ini bukan pertama kali aku ketinggalan barang.","Kamu sering lupa ya?","Iya, kadang-kadang aku lupa taruh barang di mana. Kunci, dompet, HP...","Ha ha, harus bikin kebiasaan. Selalu taruh di tempat yang sama.","Iya, kamu benar. Aku coba mulai dari sekarang.","Untung orang di warung itu jujur ya.","Iya, untung banget. Kalau hilang, susah.","Ada apa aja di dompet kamu?","Uang tunai, kartu bank, SIM... semuanya penting.","Kamu punya cadangan?","Ada sedikit uang di rumah. Tapi kalau kartu bank hilang, harus telepon bank. Ribet.","Iya, ribet banget. Syukur sudah ketemu."]'::jsonb,
  '["Oh no, I just remembered. I left my wallet at the warung earlier!","Seriously? Let''s go back now!","Yeah, let''s hurry.","*(at the warung)*","Excuse me, I ate here earlier. I left my wallet behind. Did anyone see it?","Oh, this one? There was a wallet under the table.","Yes, that''s my wallet! Thank you so much. Oh man, what a relief.","You''re welcome. Be more careful next time.","Yeah, I need to be more careful. This isn''t the first time I''ve left something behind.","You forget things a lot, huh?","Yeah, sometimes I forget where I put things. Keys, wallet, phone...","Ha ha, you gotta build a habit. Always put things in the same spot.","Yeah, you''re right. I''ll try starting now.","Good thing the people at that warung are honest.","Yeah, so lucky. If it were lost, that''d be tough.","What''s in your wallet?","Cash, bank card, driver''s license... all important stuff.","Do you have a backup?","There''s a little cash at home. But if the bank card is lost, I have to call the bank. What a hassle.","Yeah, such a hassle. Thank goodness you found it."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-19', 'ketinggalan', 'left behind / forgot to bring', 'From tinggal (to stay/remain) — very useful word', 0),
('dialog-19', 'dompet', 'wallet', null, 1),
('dialog-19', 'balik', 'to go back / return', 'Casual form of kembali', 2),
('dialog-19', 'lega', 'relieved', null, 3),
('dialog-19', 'hati-hati', 'be careful / careful', null, 4),
('dialog-19', 'kebiasaan', 'habit', 'From biasa (usual) + ke-...-an', 5),
('dialog-19', 'jujur', 'honest', null, 6),
('dialog-19', 'uang tunai', 'cash', 'Literally "ready money"', 7),
('dialog-19', 'cadangan', 'backup / reserve', null, 8),
('dialog-19', 'ribet', 'complicated / a hassle', 'Very common casual word', 9),
('dialog-19', 'syukur', 'thankfully / thank goodness', null, 10);

-- ============================================================
-- Dialogue 20: Future Plans & Dreams
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-20', 'Dialog 20: Rencana & Impian', 'Dialogue 20: Future Plans & Dreams', 'Rencana & Impian', 'Future Plans & Dreams', 'Bali',
  '["Kamu punya rencana untuk tahun depan?","Banyak. Aku mau selesaikan aplikasi yang aku bikin sekarang.","Aplikasi apa?","Aplikasi untuk acara acroyoga. Orang bisa daftar dan beli tiket lewat aplikasi.","Wah, itu bagus banget. Kamu bikin sendiri?","Iya, sendiri. Kadang-kadang susah kerja sendiri. Tapi aku suka.","Kapan selesainya?","Nggak tahu pasti. Mungkin beberapa bulan lagi. Tergantung.","Tergantung apa?","Tergantung berapa banyak fitur yang aku mau bikin. Kalau cuma yang dasar, bisa cepat. Kalau mau lengkap, butuh waktu lebih lama.","Selain itu, ada rencana lain?","Aku mau pergi ke Jerman. Ada pelatihan khusus di sana.","Pelatihan apa?","Pelatihan acroyoga. Tiga minggu. Intensif.","Tiga minggu? Lama juga. Di kota apa?","Di kota kecil. Aku lupa namanya. Tapi di Jerman timur.","Kamu mau pergi sama Jessica?","Iya, dia juga mau ikut. Tapi tiket pesawat mahal sekarang.","Coba pesan lebih awal. Biasanya lebih murah kalau pesan jauh-jauh hari.","Iya, betul. Aku harus cari tiket sekarang. Sebelum harganya naik lagi.","Jerman dingin nggak?","Tergantung kapan. Kalau musim panas, nggak terlalu dingin. Tapi kalau musim dingin, dingin banget.","Kamu sudah pernah ke Eropa sebelumnya?","Aku dari Romania. Jadi iya, aku tahu Eropa.","Oh iya, lupa. Ha ha."]'::jsonb,
  '["Do you have plans for next year?","Lots. I want to finish the app I''m building right now.","What app?","An app for acroyoga events. People can sign up and buy tickets through the app.","Wow, that''s really cool. You''re building it yourself?","Yeah, by myself. It''s hard sometimes working alone. But I like it.","When will it be done?","Not sure exactly. Maybe a few more months. It depends.","Depends on what?","Depends on how many features I want to build. If it''s just the basics, it can be quick. If I want it complete, it''ll take longer.","Besides that, any other plans?","I wanna go to Germany. There''s a special training there.","What kind of training?","Acroyoga training. Three weeks. Intensive.","Three weeks? That''s pretty long. In what city?","In a small town. I forgot the name. But in eastern Germany.","Are you going with Jessica?","Yeah, she wants to come too. But plane tickets are expensive right now.","Try booking early. It''s usually cheaper if you book well in advance.","Yeah, true. I need to look for tickets now. Before the price goes up again.","Is Germany cold?","Depends on when. If it''s summer, it''s not too cold. But in winter, it''s freezing.","Have you been to Europe before?","I''m from Romania. So yeah, I know Europe.","Oh right, I forgot. Ha ha."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-20', 'rencana', 'plan', null, 0),
('dialog-20', 'selesaikan', 'to finish / complete', 'From selesai (finished) + -kan', 1),
('dialog-20', 'daftar', 'to register / sign up', null, 2),
('dialog-20', 'fitur', 'feature', 'Borrowed from English', 3),
('dialog-20', 'lengkap', 'complete / comprehensive', null, 4),
('dialog-20', 'pelatihan', 'training / course', 'From latih (to train) + pe-...-an', 5),
('dialog-20', 'tiket pesawat', 'plane ticket', 'Pesawat = airplane', 6),
('dialog-20', 'jauh-jauh hari', 'well in advance', 'Literally "far-far days" — a useful idiom', 7),
('dialog-20', 'musim panas', 'summer', 'Musim = season; panas = hot', 8),
('dialog-20', 'musim dingin', 'winter', 'Musim = season; dingin = cold', 9),
('dialog-20', 'sebelumnya', 'before / previously', null, 10);
-- ============================================================
-- Dialogue 21: Belajar & Berkembang (Skills, Learning & Self-Improvement)
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-21', 'Dialog 21: Belajar & Berkembang', 'Dialogue 21: Skills, Learning & Self-Improvement', 'Belajar & Berkembang', 'Skills, Learning & Self-Improvement', 'Bali',
  '["Aku mau tanya sesuatu. Kamu bisa bahasa lain selain bahasa Indonesia dan bahasa Inggris?","Aku juga belajar bahasa Mandarin.","Wah, tiga bahasa? Hebat.","Belum hebat sih. Bahasa Mandarin aku masih jelek.","Bahasa Mandarin susah ya?","Susah banget. Hurufnya susah. Nada-nya juga susah. Tapi menarik.","Kenapa kamu mau belajar bahasa Mandarin?","Karena banyak orang di dunia yang bicara bahasa Mandarin. Dan aku suka tantangan.","Kamu belajar dari mana?","Aku bikin aplikasi sendiri untuk belajar bahasa Mandarin.","Serius? Kamu bikin aplikasi untuk belajar bahasa kamu sendiri?","Iya. Aku rekam suara, terus ada flashcard. Aku pakai setiap hari.","Wah, kreatif banget.","Itu salah satu keuntungan jadi developer. Kalau butuh sesuatu, bisa bikin sendiri.","Aku iri. Aku nggak bisa bikin aplikasi.","Kamu bisa belajar kok. Sekarang banyak tutorial gratis di internet.","Mungkin nanti aku coba. Tapi sekarang aku sibuk sama kerjaan.","Iya, nggak apa-apa. Pelan-pelan aja. Nggak usah buru-buru."]'::jsonb,
  '["I wanna ask you something. Can you speak any other languages besides Indonesian and English?","I''m also learning Mandarin.","Wow, three languages? Impressive.","Not that impressive though. My Mandarin is still bad.","Is Mandarin hard?","Super hard. The characters are hard. The tones are hard too. But it''s interesting.","Why do you want to learn Mandarin?","Because a lot of people in the world speak Mandarin. And I like a challenge.","Where do you learn from?","I built my own app for learning Mandarin.","Seriously? You built an app for learning your own language?","Yeah. I record audio, and there are flashcards. I use it every day.","Wow, that''s really creative.","That''s one of the perks of being a developer. If you need something, you can just build it yourself.","I''m jealous. I can''t build apps.","You can learn, you know. There are tons of free tutorials online now.","Maybe I''ll try later. But right now I''m busy with work.","Yeah, that''s fine. Take it slow. No need to rush."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-21', 'selain', 'besides / other than', null, 0),
('dialog-21', 'hebat', 'impressive / great / awesome', null, 1),
('dialog-21', 'huruf', 'letter / character', 'Huruf in Mandarin context means Chinese characters', 2),
('dialog-21', 'nada', 'tone', 'Mandarin has four tones that change word meaning', 3),
('dialog-21', 'tantangan', 'challenge', 'From tantang (to challenge) + -an', 4),
('dialog-21', 'bikin', 'to make / to build', 'Casual form of membuat', 5),
('dialog-21', 'rekam', 'to record', 'Merekam is the formal form', 6),
('dialog-21', 'keuntungan', 'advantage / benefit', 'From untung (profit/lucky) + ke-...-an', 7),
('dialog-21', 'iri', 'jealous / envious', null, 8),
('dialog-21', 'gratis', 'free (no cost)', 'Borrowed from Dutch', 9),
('dialog-21', 'buru-buru', 'to rush / in a hurry', 'Reduplication of buru', 10);


-- ============================================================
-- Dialogue 22: Beda Negara, Beda Hidup (Comparing Life in Different Countries)
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-22', 'Dialog 22: Beda Negara, Beda Hidup', 'Dialogue 22: Comparing Life in Different Countries', 'Beda Negara, Beda Hidup', 'Comparing Life in Different Countries', 'Bali',
  '["Kamu bilang kamu dari Romania. Indonesia beda banget ya sama Romania?","Beda banget. Cuacanya beda. Makanannya beda. Budayanya beda. Semuanya beda.","Yang paling beda apa?","Mungkin cuaca. Di Romania ada empat musim. Di sini cuma dua: musim panas dan musim hujan.","Kamu lebih suka yang mana?","Aku lebih suka di sini. Aku nggak suka dingin.","Romania dingin?","Waktu musim dingin, sangat dingin. Kadang-kadang sampai minus dua puluh derajat.","Aduh, nggak bisa bayangkan. Aku nggak pernah rasakan cuaca sedingin itu.","Iya, kalau kamu ke Romania musim dingin, pasti kaget. Harus pakai baju tebal banget.","Makanan Romania enak?","Enak, tapi beda. Banyak daging. Banyak roti. Nggak ada nasi.","Nggak ada nasi? Aku nggak bisa bayangkan makan tanpa nasi setiap hari.","Ha ha, iya. Orang Indonesia dan nasi itu nggak bisa pisah ya.","Betul banget. Kalau belum makan nasi, belum makan.","Aku sudah terbiasa makan nasi sekarang. Setiap hari aku makan nasi.","Itu bagus. Kamu sudah jadi orang Indonesia sedikit.","Ha ha, mungkin."]'::jsonb,
  '["You said you''re from Romania. Indonesia is really different from Romania, huh?","Super different. The weather is different. The food is different. The culture is different. Everything is different.","What''s the most different?","Probably the weather. In Romania there are four seasons. Here there''s only two: dry season and rainy season.","Which do you prefer?","I prefer it here. I don''t like the cold.","Is Romania cold?","During winter, it''s very cold. Sometimes it gets to minus twenty degrees.","Wow, I can''t imagine. I''ve never felt weather that cold.","Yeah, if you went to Romania in winter, you''d be shocked. You''d have to wear really thick clothes.","Is Romanian food good?","It''s good, but different. Lots of meat. Lots of bread. No rice.","No rice? I can''t imagine eating without rice every day.","Ha ha, yeah. Indonesians and rice are inseparable, huh.","So true. If you haven''t eaten rice, you haven''t eaten.","I''m used to eating rice now. I eat rice every day.","That''s good. You''ve become a little bit Indonesian.","Ha ha, maybe."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-22', 'beda', 'different', null, 0),
('dialog-22', 'cuaca', 'weather', null, 1),
('dialog-22', 'musim', 'season', 'Musim panas = dry/hot season, musim hujan = rainy season, musim dingin = winter', 2),
('dialog-22', 'derajat', 'degree(s)', 'Used for temperature', 3),
('dialog-22', 'bayangkan', 'to imagine', 'From bayang (shadow/image) + -kan', 4),
('dialog-22', 'kaget', 'shocked / surprised', null, 5),
('dialog-22', 'tebal', 'thick', 'Opposite of tipis (thin)', 6),
('dialog-22', 'daging', 'meat', null, 7),
('dialog-22', 'pisah', 'to separate / separated', 'Nggak bisa pisah = inseparable', 8),
('dialog-22', 'terbiasa', 'used to / accustomed to', 'From biasa (usual) + ter- prefix', 9);


-- ============================================================
-- Dialogue 23: Ngobrol Malam (Nighttime Chat / Winding Down)
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-23', 'Dialog 23: Ngobrol Malam', 'Dialogue 23: Nighttime Chat / Winding Down', 'Ngobrol Malam', 'Nighttime Chat / Winding Down', 'Bali',
  '["Wah, sudah malam ya. Jam berapa sekarang?","Sudah jam sepuluh malam.","Cepat banget ya waktunya.","Iya, kalau ngobrol enak, waktu cepat banget.","Aku harus pulang sebentar lagi. Besok harus bangun pagi.","Iya, aku juga. Besok kita ke pasar kan? Jangan lupa.","Iya, aku ingat. Jam sembilan pagi.","Jangan telat ya!","Nggak, pasti aku datang tepat waktu.","Oke. Kamu pulang naik motor?","Iya. Nggak jauh kok.","Hati-hati ya. Gelap di jalan. Banyak lubang.","Iya, aku pelan-pelan aja. Nggak usah cepat-cepat.","Oh iya, jangan lupa bawa payung besok. Mungkin hujan.","Siap. Aku selalu taruh payung di motor.","Pintar. Oke, sampai besok ya.","Sampai besok. Selamat malam!","Selamat malam. Hati-hati di jalan.","Makasih, kamu juga istirahat yang baik ya.","Pasti. Selamat tidur."]'::jsonb,
  '["Wow, it''s already late, huh. What time is it?","It''s already ten at night.","Time went by so fast.","Yeah, when the conversation is good, time flies.","I have to go home soon. I have to wake up early tomorrow.","Yeah, me too. We''re going to the market tomorrow, right? Don''t forget.","Yeah, I remember. Nine in the morning.","Don''t be late!","No way, I''ll definitely be on time.","Okay. Are you going home by motorbike?","Yeah. It''s not far.","Be careful, okay. It''s dark on the road. Lots of potholes.","Yeah, I''ll take it slow. No need to rush.","Oh right, don''t forget to bring an umbrella tomorrow. It might rain.","Got it. I always keep an umbrella on my motorbike.","Smart. Okay, see you tomorrow.","See you tomorrow. Good night!","Good night. Be careful on the road.","Thanks, you get some good rest too, okay.","For sure. Sleep well."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-23', 'ngobrol', 'to chat / to have a conversation', 'Casual — from obrol', 0),
('dialog-23', 'sebentar lagi', 'soon / in a little bit', 'Sebentar = a moment, lagi = more/again', 1),
('dialog-23', 'bangun', 'to wake up / to get up', null, 2),
('dialog-23', 'telat', 'late', 'Casual form of terlambat', 3),
('dialog-23', 'tepat waktu', 'on time', null, 4),
('dialog-23', 'gelap', 'dark', null, 5),
('dialog-23', 'lubang', 'hole / pothole', null, 6),
('dialog-23', 'payung', 'umbrella', null, 7),
('dialog-23', 'taruh', 'to put / to keep / to place', 'Casual form of menaruh', 8),
('dialog-23', 'istirahat', 'to rest / break', null, 9);


-- ============================================================
-- Dialogue 24: Di Pasar (At the Market)
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-24', 'Dialog 24: Di Pasar', 'Dialogue 24: At the Market (Next Day)', 'Di Pasar', 'At the Market', 'Bali',
  '["Pagi! Kamu sudah sampai?","Baru sampai. Kamu sudah lama di sini?","Baru lima menit. Ayo masuk.","Wah, ramai banget. Banyak orang.","Iya, pagi ini memang selalu ramai. Ayo cari baju dulu.","Aku mau cari baju yang nggak terlalu tebal. Yang tipis aja. Karena panas.","Ini bagus nih. Warnanya bagus. Mau coba?","Boleh. Berapa harganya?","*(ke penjual)* Permisi, ini berapa?","Seratus lima puluh ribu.","Bisa kurang nggak?","Hmm, seratus dua puluh ribu deh.","Gimana kalau seratus ribu?","Ya sudah, seratus ribu boleh.","Oke, aku ambil. Makasih ya.","Tuh, bisa kan? Hemat lima puluh ribu.","Iya, makasih sudah bantu. Aku nggak berani tawar sendiri.","Lama-lama juga berani. Butuh latihan aja.","Oh iya, aku juga mau beli buah. Ada penjual buah di sini?","Ada, di sebelah sana. Ayo.","Aku mau beli mangga dan pisang.","Mangga di sini enak banget. Manis.","*(ke penjual buah)* Mangganya berapa satu kilo?","Dua puluh lima ribu per kilo.","Aku mau dua kilo mangga dan satu sisir pisang.","Ini, silakan. Totalnya tujuh puluh ribu.","Ini uangnya. Makasih.","Sama-sama, terima kasih kembali."]'::jsonb,
  '["Morning! Are you here already?","Just got here. Have you been here long?","Only five minutes. Let''s go in.","Wow, it''s so crowded. Lots of people.","Yeah, mornings here are always crowded. Let''s look for clothes first.","I want to find clothes that aren''t too thick. Thin ones. Because it''s hot.","This one''s nice. Good color. Wanna try it?","Sure. How much is it?","*(to the seller)* Excuse me, how much is this?","A hundred and fifty thousand.","Can it be less?","Hmm, a hundred and twenty thousand then.","How about a hundred thousand?","Alright, a hundred thousand is fine.","Okay, I''ll take it. Thanks.","See, you can do it! Saved fifty thousand.","Yeah, thanks for helping. I didn''t dare to bargain on my own.","You''ll get the courage eventually. Just takes practice.","Oh right, I also want to buy fruit. Is there a fruit seller here?","Yeah, over there. Let''s go.","I want to buy mangoes and bananas.","The mangoes here are so good. Sweet.","*(to the fruit seller)* How much are the mangoes per kilo?","Twenty-five thousand per kilo.","I''d like two kilos of mangoes and one bunch of bananas.","Here you go. The total is seventy thousand.","Here''s the money. Thanks.","You''re welcome, thank you too."]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-24', 'ramai', 'crowded / busy / lively', null, 0),
('dialog-24', 'tipis', 'thin / lightweight', 'Opposite of tebal (thick)', 1),
('dialog-24', 'penjual', 'seller / vendor', 'From jual (to sell) + pe- prefix', 2),
('dialog-24', 'permisi', 'excuse me', 'Polite way to get someone''s attention', 3),
('dialog-24', 'kurang', 'less / to reduce', 'Bisa kurang? = Can it be less?', 4),
('dialog-24', 'hemat', 'to save (money) / thrifty', null, 5),
('dialog-24', 'berani', 'brave / to dare', 'Nggak berani = don''t dare to', 6),
('dialog-24', 'latihan', 'practice / training', null, 7),
('dialog-24', 'sisir', 'bunch / comb (of bananas)', 'Satu sisir pisang = one bunch of bananas', 8),
('dialog-24', 'silakan', 'please / go ahead', 'Polite invitation or offering', 9),
('dialog-24', 'mangga', 'mango', null, 10);


-- ============================================================
-- Dialogue 25: Refleksi & Kemajuan (Reflecting on Progress)
-- ============================================================
insert into public.stories (id, menu_title, menu_title_en, title, title_en, footer, indo, english, user_id) values
('dialog-25', 'Dialog 25: Refleksi & Kemajuan', 'Dialogue 25: Reflecting on Progress', 'Refleksi & Kemajuan', 'Reflecting on Progress', 'Bali',
  '["Hmm, aku pikir bahasa Indonesiaku sudah lebih baik dari sebelumnya.","Iya, sudah jauh lebih bagus. Kamu harus bangga.","Tapi masih banyak yang aku nggak ngerti. Kalau orang ngomong cepat, aku bingung.","Itu wajar. Bahkan orang Indonesia kadang-kadang nggak ngerti kalau orang dari daerah lain bicara.","Serius?","Iya, serius. Indonesia besar banget. Banyak dialek. Banyak bahasa daerah.","Berapa bahasa daerah di Indonesia?","Banyak banget. Mungkin lebih dari tujuh ratus.","Tujuh ratus? Ya ampun.","Iya, tapi nggak usah khawatir. Yang penting bahasa Indonesia dulu. Itu cukup untuk bicara sama semua orang.","Aku setuju. Satu bahasa dulu.","Yang penting kamu terus latihan. Terus ngomong. Terus dengar. Jangan takut salah.","Iya, kadang-kadang aku takut salah. Malu kalau salah bicara.","Jangan malu! Semua orang salah waktu belajar bahasa baru. Itu normal.","Kamu benar. Aku harus lebih berani.","Nah, gitu. Besok kita ngomong bahasa Indonesia lagi ya?","Pasti. Aku senang ngobrol sama kamu. Aku belajar banyak.","Aku juga senang. Kamu teman yang baik.","Makasih. Kamu juga. Sampai ketemu lagi ya.","Sampai ketemu. Hati-hati pulang.","Siap. Dadah!","Dadah!"]'::jsonb,
  '["Hmm, I think my Indonesian is better than before.","Yeah, way better. You should be proud.","But there''s still a lot I don''t understand. When people talk fast, I get confused.","That''s normal. Even Indonesians sometimes don''t understand when people from other regions speak.","Seriously?","Yeah, seriously. Indonesia is huge. Lots of dialects. Lots of regional languages.","How many regional languages are there in Indonesia?","A whole lot. Maybe more than seven hundred.","Seven hundred? Oh my God.","Yeah, but don''t worry. The important thing is Indonesian first. That''s enough to talk to everyone.","I agree. One language first.","The important thing is you keep practicing. Keep talking. Keep listening. Don''t be afraid of making mistakes.","Yeah, sometimes I''m afraid of making mistakes. Embarrassed if I say something wrong.","Don''t be embarrassed! Everyone makes mistakes when learning a new language. That''s normal.","You''re right. I have to be braver.","That''s the spirit. Tomorrow we''ll speak Indonesian again, okay?","Definitely. I enjoy chatting with you. I learn a lot.","I enjoy it too. You''re a good friend.","Thanks. You too. See you again, okay.","See you. Be careful going home.","Will do. Bye bye!","Bye bye!"]'::jsonb,
  'd3d205dd-98df-481d-bf3f-b4d11b3981f1');

insert into public.vocab_cards (story_id, indo, english, context, sort_order) values
('dialog-25', 'sebelumnya', 'before / previously', 'From sebelum (before) + -nya', 0),
('dialog-25', 'bangga', 'proud', null, 1),
('dialog-25', 'wajar', 'normal / natural / reasonable', null, 2),
('dialog-25', 'bahkan', 'even (emphasizer)', 'Bahkan orang Indonesia... = Even Indonesians...', 3),
('dialog-25', 'dialek', 'dialect', null, 4),
('dialog-25', 'bahasa daerah', 'regional language', 'Indonesia has 700+ regional languages', 5),
('dialog-25', 'khawatir', 'worried / concerned', null, 6),
('dialog-25', 'setuju', 'to agree', null, 7),
('dialog-25', 'takut', 'afraid / scared', null, 8),
('dialog-25', 'berani', 'brave / courageous', 'Opposite of takut', 9),
('dialog-25', 'dadah', 'bye bye', 'Casual/cute way to say goodbye', 10);

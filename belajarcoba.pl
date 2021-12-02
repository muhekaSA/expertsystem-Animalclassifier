
/*  identifikasi binatang
mulai dengan ?- mulai.     */
mulai :- hipotesis(Kucing),
write('Saya pikir Kucing itu adalah: '),
write(Kucing),
nl,
ulang.
/* hipotesis yang akan dites */
hipotesis(singa)   :- singa, !.
hipotesis(macan_tutul)     :- macan_tutul, !.
hipotesis(kucing_toyger)   :- kucing_toyger, !.
hipotesis(kucing_tiffany)  :- kucing_tiffany, !.
hipotesis(maine_coon)   :- maine_coon, !.
hipotesis(birman)   :- birman, !.
hipotesis(abyssinian) :- abyssinian, !.
hipotesis(ragdoll):-ragdoll, !.
hipotesis(turkish_van):-turkish_van, !.
hipotesis(tidak_dikenali).             /* tidak ada diagnosa */
/* aturan identifikasi binatang */
singa :- mamalia,
carnivora,
periksa(berbulu_lebat),
periksa(tidak_dapat_memanjat_pohon),
periksa(umur_10_sampai_20_tahun).
macan_tutul :- mamalia,
carnivora,
periksa(kulit_bercorak),
periksa(bergaris_hitam),
periksa(panjang_badan_antara_1_sampai_2_meter).
kucing_toyger :- mamalia,
periksa(kulit_bercorak),
periksa(bergaris_hitam),
periksa(tempremen_baik),
periksa(kesehatan_baik),
periksa(relatif_tahan_terhadap_penyakit).
kucing_tiffany :- mamalia,
periksa(berukuran_medium),
periksa(berat_badan_antara_4_sampai_5_kg),
periksa(bentuk_kepala_hampir_seperti_segi_tiga),
periksa(moncong_pendek),
periksa(dagu_kecil),
periksa(telinga_besar).
maine_coon :- mamalia,
periksa(badan_besar_dan_panjang_serat_agak_berbentuk_segi_empat),
periksa(mata_lebar_serta_oval),
periksa(ekor_panjang_dan_lebar),
periksa(ekor_panjang_dan_lebar),
periksa(telinga_lebar_di_bawah),
periksa(dahi_melengkung).
birman :- mamalia,
periksa(berat_badan_antara_4_sampai_6_kg),
periksa(pola_warna_mirip_dengan_colour_point),
periksa(bulu_ekor_dan_leher_yang_paling_menonjol_yaitu_tebal_dan_halus),
periksa(panjang_tubuh_kucing_sedang_tapi_berbentuk_tegap),
periksa(kucing_ini_sangat_menyukai_manusia).
abyssinian :- mamalia,
periksa(tubuh_berotot),
periksa(memiliki_lengkung_leher_serta_bahu_yang_indah),
periksa(bentuk_mata_menyerupai_almond),
periksa(telinga_besar),
periksa(kaki_panjang_dan_langsing),
periksa(kepala_berbentuk_segitiga).
ragdoll :- mamalia,
periksa(mempunyai_4_jenis_warna_yaitu_seal_blue_chocolate_dan_lilac),
periksa(bagian_dada_lebar),
periksa(memiliki_panggul_yang_besar),
periksa(bulu_medium_panjang_dan_teksturnya_mirip_kelinci),
periksa(menjadi_kucing_dewasa_pada_umur_3_tahun).
turkish_van :- mamalia,
periksa(badan_yang_cukup_besar),
periksa(bulu_tebal),
periksa(umurnya_antara_3_sampai_5_tahun),
periksa(berat_maksimal_9_kg).
/* aturan klasifikasi */
mamalia    :- periksa(berambut), !.
mamalia    :- periksa(menyusui).
carnivora :- periksa(pemakan_daging), !.
carnivora :- periksa(bergigi_tajam),
periksa(mempunyai_cakar),
periksa(mata_didepan).
/* Bagaimana cara bertanya */
tanya(Pertanyaan) :-
write('Apakah binatang itu mempunyai ciri: '),
write(Pertanyaan),
write(‘?‘),
read(Jawaban),
nl,
( (Jawaban== ya ; Jawaban == y)
->
assert(ya(Pertanyaan)) ;
assert(tidak(Pertanyaan)), fail).
:- dynamic ya/1,tidak/1.
/* Bagaimana memeriksa sesuatu */
periksa(S) :-
(ya(S)
->
true ;
(tidak(S)
->
fail ;
tanya(S))).
/* ulang semua penyataan ya/tidak */
ulang :- retract(ya(_)),fail.
ulang :- retract(tidak(_)),fail.
ulang.

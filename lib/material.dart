class AlShaikh{
  final String name;
  final String image;
  final String url;
  AlShaikh({
    required this.name,
    required this.image,
    required this.url,
  });
}
List<AlShaikh> allReaders=[
  AlShaikh(name: 'عبدالباسط عبدالصمد', image: 'assets/images/1.png', url: '13.mp3quran.net/basit_mjwd'),
  AlShaikh(name: 'محمد صديق المنشاوي ', image: 'assets/images/2.jpg', url: '10.mp3quran.net/minsh'),
  AlShaikh(name: 'محمد رفعت', image: 'assets/images/3.jpg', url: '14.mp3quran.net/refat'),
  AlShaikh(name: 'محمود علي البنا', image: 'assets/images/4.jpg', url: '8.mp3quran.net/bna'),
  AlShaikh(name: 'محمود خليل الحصري', image: 'assets/images/5.jpg', url: '13.mp3quran.net/husr'),
  AlShaikh(name: 'محمد أيوب', image: 'assets/images/6.jpg', url: '8.mp3quran.net/ayyub'),
  AlShaikh(name: 'فارس عباد', image: 'assets/images/7.jpg', url: '8.mp3quran.net/frs_a'),
  AlShaikh(name: 'ناصر القطامي', image: 'assets/images/8.jpg', url: '6.mp3quran.net/qtm'),
  AlShaikh(name: 'ياسر الدوسري', image: 'assets/images/9.jpg', url: '11.mp3quran.net/yasser'),
  AlShaikh(name: 'ماهر المعيقلي', image: 'assets/images/10.jpg', url: '12.mp3quran.net/maher'),
  AlShaikh(name: 'صلاح بو خاطر', image: 'assets/images/11.jpg', url: '8.mp3quran.net/bu_khtr'),
  AlShaikh(name: 'أحمد العجمي', image: 'assets/images/12.jpg', url: '10.mp3quran.net/ajm'),
  AlShaikh(name: 'عبد الرحمن السديس', image: 'assets/images/13.jpg', url: '11.mp3quran.net/sds'),
  AlShaikh(name: 'سعد الغامدي', image: 'assets/images/14.jpg', url: '7.mp3quran.net/s_gmd'),
  AlShaikh(name: 'مشاري راشد العفاسي', image: 'assets/images/15.jpg', url: '8.mp3quran.net/afs'),
  AlShaikh(name: 'عبدالله المطرود', image: 'assets/images/16.jpg', url: '8.mp3quran.net/mtrod'),
  AlShaikh(name: 'اسلام صبحي', image: 'assets/images/17.jpg', url: 'https://ia801406.us.archive.org/12/items/002_20221103_202211'),
];

class QuranChapter {
  final String nameArabic;
  final String number;
  QuranChapter({
    required this.nameArabic,
    required this.number,
  });
}

List<QuranChapter> hollyQuraan=[
  QuranChapter(nameArabic: "الفاتحة", number: "001"),
  QuranChapter(nameArabic: "البقرة", number: "002"),
  QuranChapter(nameArabic: "آل عمران", number: "003"),
  QuranChapter(nameArabic: "النساء", number: "004"),
  QuranChapter(nameArabic: "المائدة", number: "005"),
  QuranChapter(nameArabic: "الأنعام", number: "006"),
  QuranChapter(nameArabic: "الأعراف", number: "007"),
  QuranChapter(nameArabic: "الأنفال", number: "008"),
  QuranChapter(nameArabic: "التوبة", number: "009"),
  QuranChapter(nameArabic: "يونس", number: "010"),
  QuranChapter(nameArabic: "هود", number: "011"),
  QuranChapter(nameArabic: "يوسف", number: "012"),
  QuranChapter(nameArabic: "الرعد", number: "013"),
  QuranChapter(nameArabic: "إبراهيم", number: "014"),
  QuranChapter(nameArabic: "الحجر", number: "015"),
  QuranChapter(nameArabic: "النحل", number: "016"),
  QuranChapter(nameArabic: "الإسراء", number: "017"),
  QuranChapter(nameArabic: "الكهف", number: "018"),
  QuranChapter(nameArabic: "مريم", number: "019"),
  QuranChapter(nameArabic: "طه", number: "020"),
  QuranChapter(nameArabic: "الأنبياء", number: "021"),
  QuranChapter(nameArabic: "الحج", number: "022"),
  QuranChapter(nameArabic: "المؤمنون", number: "023"),
  QuranChapter(nameArabic: "النور", number: "024"),
  QuranChapter(nameArabic: "الفرقان", number: "025"),
  QuranChapter(nameArabic: "الشعراء", number: "026"),
  QuranChapter(nameArabic: "النمل", number: "027"),
  QuranChapter(nameArabic: "القصص", number: "028"),
  QuranChapter(nameArabic: "العنكبوت", number: "029"),
  QuranChapter(nameArabic: "الروم", number: "030"),
  QuranChapter(nameArabic: "لقمان", number: "031"),
  QuranChapter(nameArabic: "السجدة", number: "032"),
  QuranChapter(nameArabic: "الأحزاب", number: "033"),
  QuranChapter(nameArabic: "سبأ", number: "034"),
  QuranChapter(nameArabic: "فاطر", number: "035"),
  QuranChapter(nameArabic: "يس", number: "036"),
  QuranChapter(nameArabic: "الصافات", number: "037"),
  QuranChapter(nameArabic: "ص", number: "038"),
  QuranChapter(nameArabic: "الزمر", number: "039"),
  QuranChapter(nameArabic: "غافر", number: "040"),
  QuranChapter(nameArabic: "فصلت", number: "041"),
  QuranChapter(nameArabic: "الشورى", number: "042"),
  QuranChapter(nameArabic: "الزخرف", number: "043"),
  QuranChapter(nameArabic: "الدخان", number: "044"),
  QuranChapter(nameArabic: "الجاثية", number: "045"),
  QuranChapter(nameArabic: "الأحقاف", number: "046"),
  QuranChapter(nameArabic: "محمد", number: "047"),
  QuranChapter(nameArabic: "الفتح", number: "048"),
  QuranChapter(nameArabic: "الحشر", number: "059"),
  QuranChapter(nameArabic: "الممتحنة", number: "060"),
  QuranChapter(nameArabic: "الصف", number: "061"),
  QuranChapter(nameArabic: "الجمعة", number: "062"),
  QuranChapter(nameArabic: "المنافقون", number: "063"),
  QuranChapter(nameArabic: "التغابن", number: "064"),
  QuranChapter(nameArabic: "الطلاق", number: "065"),
  QuranChapter(nameArabic: "التحريم", number: "066"),
  QuranChapter(nameArabic: "الملك", number: "067"),
  QuranChapter(nameArabic: "القلم", number: "068"),
  QuranChapter(nameArabic: "الحاقة", number: "069"),
  QuranChapter(nameArabic: "المعارج", number: "070"),
  QuranChapter(nameArabic: "نوح", number: "071"),
  QuranChapter(nameArabic: "الجن", number: "072"),
  QuranChapter(nameArabic: "المزمل", number: "073"),
  QuranChapter(nameArabic: "المدثر", number: "074"),
  QuranChapter(nameArabic: "القيامة", number: "075"),
  QuranChapter(nameArabic: "الإنسان", number: "076"),
  QuranChapter(nameArabic: "الإنسان", number: "076"),
  QuranChapter(nameArabic: "المرسلات", number: "077"),
  QuranChapter(nameArabic: "النبأ", number: "078"),
  QuranChapter(nameArabic: "النازعات", number: "079"),
  QuranChapter(nameArabic: "عبس", number: "080"),
  QuranChapter(nameArabic: "التكوير", number: "081"),
  QuranChapter(nameArabic: "الإنفطار", number: "082"),
  QuranChapter(nameArabic: "المطففين", number: "083"),
  QuranChapter(nameArabic: "الإنشقاق", number: "084"),
  QuranChapter(nameArabic: "البروج", number: "085"),
  QuranChapter(nameArabic: "الطارق", number: "086"),
  QuranChapter(nameArabic: "الأعلى", number: "087"),
  QuranChapter(nameArabic: "الغاشية", number: "088"),
  QuranChapter(nameArabic: "الفجر", number: "089"),
  QuranChapter(nameArabic: "البلد", number: "090"),
  QuranChapter(nameArabic: "الشمس", number: "091"),
  QuranChapter(nameArabic: "الليل", number: "092"),
  QuranChapter(nameArabic: "الضحى", number: "093"),
  QuranChapter(nameArabic: "الشرح", number: "094"),
  QuranChapter(nameArabic: "التين", number: "095"),
  QuranChapter(nameArabic: "العلق", number: "096"),
  QuranChapter(nameArabic: "القدر", number: "097"),
  QuranChapter(nameArabic: "البينة", number: "098"),
  QuranChapter(nameArabic: "الزلزلة", number: "099"),
  QuranChapter(nameArabic: "العاديات", number: "100"),
  QuranChapter(nameArabic: "القارعة", number: "101"),
  QuranChapter(nameArabic: "التكاثر", number: "102"),
  QuranChapter(nameArabic: "العصر", number: "103"),
  QuranChapter(nameArabic: "الهمزة", number: "104"),
  QuranChapter(nameArabic: "الفيل", number: "105"),
  QuranChapter(nameArabic: "قريش", number: "106"),
  QuranChapter(nameArabic: "الماعون", number: "107"),
  QuranChapter(nameArabic: "الكوثر", number: "108"),
  QuranChapter(nameArabic: "الكافرون", number: "109"),
  QuranChapter(nameArabic: "النصر", number: "110"),
  QuranChapter(nameArabic: "المسد", number: "111"),
  QuranChapter(nameArabic: "الإخلاص", number: "112"),
  QuranChapter(nameArabic: "الفلق", number: "113"),
  QuranChapter(nameArabic: "الناس", number: "114"),
];
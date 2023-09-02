import 'package:flutter/material.dart';
import 'package:quran_app/quran_list.dart';

class ElQuraaScreen extends StatelessWidget {
  var nameController = TextEditingController();
  List elQuraaimages = [
    'assets/images/1.png',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
    'assets/images/9.jpg',
    'assets/images/10.jpg',
    'assets/images/11.jpg',
    'assets/images/12.jpg',
    'assets/images/13.jpg',
    'assets/images/14.jpg',
    'assets/images/15.jpg',
    'assets/images/16.jpg',
    'assets/images/17.jpg',
  ];
  List elQuraaNames = [
    'عبدالباسط عبدالصمد',
    'محمد صديق المنشاوي ',
    'محمد رفعت',
    'محمود علي البنا',
    'محمود خليل الحصري',
    'محمد أيوب',
    'فارس عباد',
    'ناصر القطامي',
    'ياسر الدوسري',
    'ماهر المعيقلي',
    'صلاح بو خاطر',
    'أحمد العجمي',
    'عبد الرحمن السديس',
    'سعد الغامدي',
    'مشاري راشد العفاسي',
    'عبدالله المطرود',
    'اسلام صبحي',
  ];
  List url = [
    '13.mp3quran.net/basit_mjwd',
    '10.mp3quran.net/minsh',
    '14.mp3quran.net/refat',
    '8.mp3quran.net/bna',
    '13.mp3quran.net/husr',
    '8.mp3quran.net/ayyub',
    '8.mp3quran.net/frs_a',
    '6.mp3quran.net/qtm',
    '11.mp3quran.net/yasser',
    '12.mp3quran.net/maher',
    '8.mp3quran.net/bu_khtr',
    '10.mp3quran.net/ajm',
    '11.mp3quran.net/sds',
    '7.mp3quran.net/s_gmd',
    '8.mp3quran.net/afs',
    '8.mp3quran.net/mtrod',
    'https://ia801406.us.archive.org/12/items/002_20221103_202211',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'القراء',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown.shade900,
        elevation: 0.0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.brown[200]!,
              Colors.brown,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildElquraaItem(context, index),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10.0,
                        ),
                    itemCount: elQuraaNames.length),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildElquraaItem(context, index) => Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          color: Colors.brown[800],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QuranListView(
                          url: url[index],
                          Alqarea: elQuraaNames[index],
                          image: elQuraaimages[index],
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back),
                Spacer(),
                Text(
                  elQuraaNames[index],
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
                SizedBox(width: 5.0,),
                CircleAvatar(backgroundImage: AssetImage(elQuraaimages[index]),)
              ],
            ),
          ),
        ),
      );
}

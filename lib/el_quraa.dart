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
    'assets/images/7.jpg'
  ];
  List elQuraaNames = [
    'عبدالباسط عبد الصمد',
    'محمد صديق المنشاوي ',
    'محمود علي البنا',
    'محمود خليل الحصري',
    'محمد أيوب',
    'ياسر الدوسري'
  ];
  List url = [
    '13.mp3quran.net/basit_mjwd',
    '10.mp3quran.net/minsh',
    '8.mp3quran.net/bna',
    '13.mp3quran.net/husr',
    '8.mp3quran.net/ayyub',
    '11.mp3quran.net/yasser',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'القرآن الكريم',
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
              ],
            ),
          ),
        ),
      );
}

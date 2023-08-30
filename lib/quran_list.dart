// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quran_app/quran_screen.dart';

class QuranListView extends StatelessWidget {
  var nameController = TextEditingController();
  List name = [
    'سورة الفاتحة',
    'سورة البقرة',
    'سورة آل عمران',
    'سورة النساء',
    'سورة المائدة',
    'سورة الأنعام',
    'سورة الأعراف',
    'سورة الأنفال',
    'سورة التوبة',
    'سورة يونس',
    'سورة هود',
    'سورة يوسف',
    'سورة الرعد',
    'سورة ابراهيم',
    'سورة الحجر',
    'سورة النحل',
    'سورة الإسراء',
    'سورة الكهف',
    'سورة مريم',
    'سورة طه',
    'سورة الأنبياء',
    'سورة الحج',
    'سورة المؤمنون',
    'سورة النور',
    'سورة الفرقان',
    'سورة الشعراء',
    'سورة النمل',
    'سورة القصص',
    'سورة العنكبوت',
    'سورة الروم',
    'سورة لقمان',
    'سورة السجدة',
    'سورة الأحزاب',
    'سورة سبأ',
    'سورة فاطر',
    'سورة يس',
    'سورة الصافات',
    'سورة ص',
    'سورة الزمر',
    'سورة غافر',
    'سورة فصلت',
    'سورة الشورى',
    'سورة الزخرف',
    'سورة الدخان',
    'سورة الجاثية',
    'سورة الأحقاف',
    'سورة محمد',
    'سورة الفتح',
    'سورة الحجرات',
    'سورة ق',
    'سورة الذاريات',
    'سورة الطور',
    'سورة النجم',
    'سورة القمر',
    'سورة الرحمن',
    'سورة الواقعة',
    'سورة الحديد',
    'سورة المجادلة',
    'سورة الحشر',
    'سورة الممتحنة',
    'سورة الصف',
    'سورة الجمعة',
    'سورة المنافقون',
    'سورة التغابن',
    'سورة الطلاق',
    'سورة التحريم',
    'سورة الملك',
    'سورة القلم',
    'سورة الحاقة',
    'سورة المعارج',
    'سورة نوح',
    'سورة الجن',
    'سورة المزمل',
    'سورة المدثر',
    'سورة القيامة',
    'سورة الإنسان',
    'سورة المرسلات',
    'سورة النبأ',
    'سورة النازعات',
    'سورة عبس',
    'سورة التكوير',
    'سورة الإنفطار',
    'سورة المطففين',
    'سورة الانشقاق',
    'سورة البروج',
    'سورة الطارق',
    'سورة الأعلى',
    'سورة الغاشية',
    'سورة الفجر',
    'سورة البلد',
    'سورة الشمس',
    'سورة الليل',
    'سورة الضحى',
    'سورة الشرح',
    'سورة التين',
    'سورة العلق',
    'سورة القدر',
    'سورة البينة',
    'سورة الزلزلة',
    'سورة العاديات',
    'سورة القارعة',
    'سورة التكاثر',
    'سورة العصر',
    'سورة الهمزة',
    'سورة الفيل',
    'سورة قريش',
    'سورة الماعون',
    'سورة الكوثر',
    'سورة الكافرون',
    'سورة النصر',
    'سورة المسد',
    'سورة الإخلاص',
    'سورة الفلق',
    'سورة الناس',
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
                    itemBuilder: (context , index)=>buildListItem(context , index),
                    separatorBuilder: (context , index)=> SizedBox(height: 10.0,),
                    itemCount: name.length
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildListItem(context , index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0,),color: Colors.brown[800],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QuranScreen(name: name[index],index: index,)));
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
                  name[index],
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ],
            ),
          ),
        ),
      );
}

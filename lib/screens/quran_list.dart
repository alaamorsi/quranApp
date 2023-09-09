// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:quran_app/material.dart';
import 'package:quran_app/our_widgets.dart';
import 'package:quran_app/screens/quran_screen.dart';
import 'package:quran_app/screens/search_of_quran.dart';

class QuranListView extends StatelessWidget {

  AlShaikh shaikh;
  late AlShaikh shaikhQ;

  QuranListView({required this.shaikh,super.key}) {
    shaikhQ = shaikh;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'القرآن الكريم',iconButton: true,icon: Icons.search,navScreen: SearchOfQuran(shaikh: shaikh)),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blueGrey.shade300,
              Colors.blueGrey.shade600
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
                    itemBuilder: (context , index) =>
                        chapterItem(context: context, from: hollyQuraan, index: index, navScreen: QuranScreen(chapter: hollyQuraan[index], shaikh: shaikh)),
                    separatorBuilder: (context , index)=> SizedBox(height: 10.0,),
                    itemCount: hollyQuraan.length
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
                MaterialPageRoute(builder: (context) => QuranScreen(chapter: hollyQuraan[index], shaikh: shaikh)));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0,),
                    color: Colors.white,),
                  child: Icon(Icons.add,color: Colors.brown),
                ),
                Spacer(),
                Text(
                  ' سورة ${hollyQuraan[index].nameArabic}',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ],
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:quran_app/screens/el_quraa.dart';
import 'package:quran_app/screens/learning2.dart';
import 'package:quran_app/screens/motshabhat.dart';
import 'package:quran_app/screens/mushaf.dart';
import 'screens/al_azkaar.dart';
import 'screens/masbaha.dart';
import 'our_widgets.dart';

//000000000000000000000

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}
class _FirstScreenState extends State<FirstScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'اسلامي'),
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
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
            Row(
            children: [
                firstScreenItem(context: context, title: 'الأستماع', navTo: ElQuraaScreen(), icon: Icons.mosque),
              SizedBox(width: 20.0,),
              firstScreenItem(context: context, title: 'المصحف', navTo: MushafScreen(), icon: Icons.import_contacts),
              ]
            ),
            SizedBox(height: 20.0,),
            Row(
              children: [
                firstScreenItem(context: context, title: 'المتشابهات', navTo: MotshabhatScreen(), icon:Icons.ballot),
                SizedBox(width: 20.0,),
                firstScreenItem(context: context, title: 'المسبحة', navTo: Masbaha(), icon:Icons.data_saver_on),
              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              children: [
                firstScreenItem(context: context, title: 'أذكار الصباح', navTo: MorAndEvenAzkaar(time: 'أذكار الصباح'), icon: Icons.light_mode),
                SizedBox(width: 20.0,),
                firstScreenItem(context: context, title: 'أذكار المساء', navTo: MorAndEvenAzkaar(time: 'أذكار المساء'), icon: Icons.dark_mode),
              ]
              ),
            SizedBox(height: 20.0,),
            Row(
              //new
                children: [
                  firstScreenItem(context: context, title: 'تعلم الوضوء', navTo: Learning2Screen(title: 'تعلم الوضوء'), icon: Icons.book_rounded),
                  SizedBox(width: 20.0,),
                  firstScreenItem(context: context, title: 'تعلم الصلاة', navTo: Learning2Screen(title: 'تعلم الصلاة'), icon: Icons.man_sharp),
                ]
            ),
            ]
          ),
        ),
      ),
    );
  }

  //design for horizental and vertical widgets
}


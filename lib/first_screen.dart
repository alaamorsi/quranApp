import 'package:flutter/material.dart';
import 'package:quran_app/screens/el_quraa.dart';
import 'package:quran_app/screens/motshabhat.dart';
import 'package:quran_app/screens/mushaf.dart';
import 'screens/al_azkaar.dart';
import 'screens/masbaha.dart';
import 'our_widgets.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}
class _FirstScreenState extends State<FirstScreen> {
  int selectedIndex = 0;
  bool cardV=true;
  bool mode = true;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        width: 150.0,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
          children: [
            Container(
              width: double.infinity,
              height: 80.0,
              child: DrawerHeader(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('الاعدادات', style: TextStyle(color: Colors.white,fontSize: 20)),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                      color: Colors.brown,
                  ),
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0)
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
              selectedTileColor: Colors.brown.shade300,
              selectedColor: Colors.white,
              leading: mode?Icon(Icons.light_mode):Icon(Icons.dark_mode),
              selected: selectedIndex == 0,
              onTap: () {
                onItemTapped(0);
                setState(() {
                  mode= !mode;
                });
              },
            ),
            ListTile(
              selectedTileColor: Colors.brown.shade300,
              selectedColor: Colors.white,
              leading: cardV?Icon(Icons.margin_outlined):Icon(Icons.credit_card_sharp),
              selected: selectedIndex == 1,
              onTap: () {
                onItemTapped(1);
                setState(() {
                  cardV= !cardV;
                });
              },
            )
          ],
        ),
      ),
      appBar: myAppBar(context: context, title: 'اسلامي'),
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
          padding: const EdgeInsets.all(20.0),
          child: firstDesign(cardV)
        ),
      ),
    );
  }
  Widget firstDesign(bool v)
  {
    if (v)
    {
      return Column(
          children: [
            Row(
                children: [
                  firstScreenItem(context: context, title: 'الأستماع', navTo: ElQuraaScreen(), icon: Icons.mosque),
                  SizedBox(width: 10.0,),
                  firstScreenItem(context: context, title: 'المصحف', navTo: MushafScreen(), icon: Icons.import_contacts),
                  SizedBox(width: 10.0,),
                  firstScreenItem(context: context, title: 'المتشابهات', navTo: MotshabhatScreen(), icon:Icons.ballot),
                ]
            ),
            SizedBox(height: 10.0,),
            Row(
                children: [
                  firstScreenItem(context: context, title: 'أذكار الصباح', navTo: MorAndEvenAzkaar(time: 'أذكار الصباح'), icon: Icons.light_mode),
                  SizedBox(width: 10.0,),
                  firstScreenItem(context: context, title: 'أذكار المساء', navTo: MorAndEvenAzkaar(time: 'أذكار المساء'), icon: Icons.dark_mode),
                  SizedBox(width: 10.0,),
                  firstScreenItem(context: context, title: 'المسبحة', navTo: Masbaha(), icon:Icons.data_saver_on),                ]
            ),
          ]
      );
    }
    else
      {
        return ListView(
              children: [
                firstScreenItemV(context: context, title: 'الأستماع', navTo: ElQuraaScreen(), icon: Icons.mosque),
                SizedBox(height: 20.0,),
                firstScreenItemV(context: context, title: 'المصحف', navTo: MushafScreen(), icon: Icons.import_contacts),
                SizedBox(height: 20.0,),
                firstScreenItemV(context: context, title: 'المتشابهات', navTo: MotshabhatScreen(), icon:Icons.ballot),
                SizedBox(height: 20.0,),
                firstScreenItemV(context: context, title: 'أذكار الصباح', navTo: MorAndEvenAzkaar(time: 'أذكار الصباح'), icon: Icons.light_mode),
                SizedBox(height: 20.0,),
                firstScreenItemV(context: context, title: 'أذكار المساء', navTo: MorAndEvenAzkaar(time: 'أذكار المساء'), icon: Icons.dark_mode),
                SizedBox(height: 20.0,),
                firstScreenItemV(context: context, title: 'المسبحة', navTo: Masbaha(), icon:Icons.data_saver_on),
              ]
        );
      }
  }
}


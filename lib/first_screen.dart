import 'package:flutter/material.dart';
import 'package:quran_app/azkar/azkaar.dart';
import 'package:quran_app/quran/el_quraa.dart';
import 'package:quran_app/quran/mushaf.dart';

class FirstScreen extends StatelessWidget {
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //for the image
              Container(height: 300,
                width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: AssetImage('assets/AppImage.jpg')
                        ,fit: BoxFit.cover),
                  ),
              ),
              SizedBox(height: 20.0,),
              //for the first button
              justItem(context: context, title: 'الأستماع', navTo: ElQuraaScreen()),
              SizedBox(height: 20.0,),
              //for the second button
              justItem(context: context, title: 'المصحف', navTo: MushafScreen()),
              SizedBox(height: 20.0,),
              //therd button
              justItem(context: context, title: 'الأذكار', navTo: AzkaarScreen()),
            ]
          ),
        ),
      ),
    );
  }
  Widget justItem({required context,required String title,required  navTo})=>
      Expanded(
        child: InkWell(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => navTo));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.brown.shade900,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(image: AssetImage('assets/background/b1.jpg'),fit: BoxFit.cover),
            ),
            child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontSize: 22.0),)),
          ),
        ),
      );

}


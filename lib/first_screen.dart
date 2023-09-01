import 'package:flutter/material.dart';
import 'package:quran_app/azkaar.dart';
import 'package:quran_app/el_quraa.dart';
import 'package:quran_app/mushaf.dart';

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
        child: Column(
          children: [
            //for the image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
              child: Container(height: 300.0,width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        image: AssetImage('assets/AppImage.jpg')
                        ,fit: BoxFit.cover),
                  ),
              ),
            ),
            //for the first button
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ElQuraaScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                child: Container(
                  height: 80.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.brown[800],
                    borderRadius: BorderRadius.circular(25.0),),
                  child: Center(child: Text('الاستماع',style: TextStyle(color: Colors.white,fontSize: 22.0),)),
                ),
              ),
            ),
            //for the second button
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MushafScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                child: Container(
                  height: 80.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.brown[800],
                    borderRadius: BorderRadius.circular(25.0),),
                  child: Center(child: Text('المصحف',style: TextStyle(color: Colors.white,fontSize: 22.0),)),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AzkaarScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                child: Container(
                  height: 80.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.brown[800],
                    borderRadius: BorderRadius.circular(25.0),),
                  child: Center(child: Text('الأذكار',style: TextStyle(color: Colors.white,fontSize: 22.0),)),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}

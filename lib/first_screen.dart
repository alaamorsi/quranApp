import 'package:flutter/material.dart';
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
              child: Container(height: 400,width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        image: AssetImage('assets/images/firstScreenImage.png')
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
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  height: 90.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.brown[800],
                    borderRadius: BorderRadius.circular(25.0),),
                  child: Center(child: Text('استمع للقرآن',style: TextStyle(color: Colors.white,fontSize: 22.0),)),
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
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 90.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.brown[800],
                    borderRadius: BorderRadius.circular(25.0),),
                  child: Center(child: Text('قراءة القرآن',style: TextStyle(color: Colors.white,fontSize: 22.0),)),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}

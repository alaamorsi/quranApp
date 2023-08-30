import 'package:flutter/material.dart';
import 'package:quran_app/colors.dart';
import 'package:quran_app/quran_list.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        title: Text(
          'القرآن الكريم',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
        elevation: 0.0,
      ),
      body: Column(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              height: 90.0,
              width: 300.0,
              decoration: BoxDecoration(
                color: soraButtonColor,
                borderRadius: BorderRadius.circular(25.0),),
              child: MaterialButton(
                onPressed: (){Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QuranListView()));},
                child: Text('استمع للقرآن',style: TextStyle(color: Colors.white,fontSize: 22.0),),),
            ),
          ),
          //for the second button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 90.0,
              width: 300.0,
              decoration: BoxDecoration(
                color: soraButtonColor,
                borderRadius: BorderRadius.circular(25.0),),
              child: MaterialButton(
                onPressed: (){Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuranListView()));},
                child: Text('قراءة القرآن',style: TextStyle(color: Colors.white,fontSize: 22.0),),),
            ),
          ),
        ]
      ),
    );
  }
}

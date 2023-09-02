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
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ElQuraaScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.brown[400]!,
                          Colors.brown[700]!,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(child: Text('الأستماع',style: TextStyle(color: Colors.white,fontSize: 22.0),)),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              //for the second button
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MushafScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.brown[400]!,
                          Colors.brown[700]!,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(child: Text('المصحف',style: TextStyle(color: Colors.white,fontSize: 22.0),)),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              //therd button
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AzkaarScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.brown[400]!,
                          Colors.brown[700]!,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(child: Text('الأذكار',style: TextStyle(color: Colors.white,fontSize: 22.0),)),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}

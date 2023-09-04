import 'package:flutter/material.dart';
import 'package:quran_app/al_azkaar.dart';

class AzkaarScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الأذكار',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),),
          centerTitle: true,
          backgroundColor: Colors.brown.shade900,
          elevation: 0.0,),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
              Colors.brown[200]!,
              Colors.brown,
              ]
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child:Column(
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0,),color: Colors.brown[800],),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MorAndEvenAzkaar(time: 'أذكار الصباح')));
                      },
                      child: Row(
                        children: [
                          Spacer(),
                          Text('أذكار الصباح',style: TextStyle(color: Colors.white, fontSize: 22.0),),
                          SizedBox(width: 10.0,),
                          Icon(Icons.light_mode,color: Colors.white,),
                          SizedBox(width: 10.0,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0,),color: Colors.brown[800],),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MorAndEvenAzkaar(time: 'أذكار المساء')));
                      },
                      child: Row(
                        children: [
                          Spacer(),
                          Text('أذكار المساء',style: TextStyle(color: Colors.white, fontSize: 22.0),),
                          SizedBox(width: 10.0,),
                          Icon(Icons.dark_mode,color: Colors.white,),
                          SizedBox(width: 10.0,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0,),color: Colors.brown[800],),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MorAndEvenAzkaar(time: 'المسبحة')));
                      },
                      child: Row(
                        children: [
                          Spacer(),
                          Text('المسبحة',style: TextStyle(color: Colors.white, fontSize: 22.0),),
                          SizedBox(width: 10.0,),
                          Icon(Icons.data_saver_on,color: Colors.white,),
                          SizedBox(width: 10.0,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
            ]
          ),
        ),
      ),
    );
  }
}

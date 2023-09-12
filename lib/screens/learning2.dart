import 'package:flutter/material.dart';
import 'package:quran_app/our_widgets.dart';

// ignore: must_be_immutable
class Learning2Screen extends StatefulWidget {

  String title;
  late String titleQ;

  Learning2Screen({required this.title,super.key}) {
    titleQ = title;
  }

  @override
  State<Learning2Screen> createState() =>Learning2ScreenState();
}

class Learning2ScreenState extends State<Learning2Screen> {

  List<String> washingImages = [
    'assets/wash_and_pray/1.jpg',
    'assets/wash_and_pray/2.jpg',
    'assets/wash_and_pray/3.jpg',
    'assets/wash_and_pray/4.jpg',
    'assets/wash_and_pray/5.jpg',
    'assets/wash_and_pray/6.jpg',
    'assets/wash_and_pray/7.jpg',
    'assets/wash_and_pray/8.jpg',
    'assets/wash_and_pray/9.jpg',
    ];
  List<String> prayingImages = [
    'assets/wash_and_pray/10.jpg',
    'assets/wash_and_pray/20.jpg',
    'assets/wash_and_pray/30.jpg',
    'assets/wash_and_pray/40.jpg',
    'assets/wash_and_pray/50.jpg',
    'assets/wash_and_pray/60.jpg',
    'assets/wash_and_pray/70.jpg',
    'assets/wash_and_pray/80.jpg',
    'assets/wash_and_pray/90.jpg',
    'assets/wash_and_pray/100.jpg',
    'assets/wash_and_pray/110.jpg',
  ];

  List<String> washingNotes =[
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  List<String> prayingNotes =[
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];
  List<String> learn = [];
  List<String> notes = [];
  int plus = 0;

  @override
  Widget build(BuildContext context) {
    if(widget.title =='تعلم الوضوء')
      {
        learn = washingImages;
        notes = washingNotes;
      } else {
        learn = prayingImages;
        notes = prayingNotes;
      }
    return Scaffold(
      appBar: myAppBar(context: context, title: widget.title),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blueGrey.shade300,
                Colors.blueGrey.shade600
              ]
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35.0,horizontal: 25.0),
          child: InkWell(
            onTap: ()
            {
              if(plus < learn.length-1){
                setState(() {
                  plus +=1;
                });
              }
              else
              {
                setState(() {
                  plus =0;
                });
              }
            },
            child:Column(
                children: [
                  //image
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: AssetImage(learn[plus]),
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(height: 25.0,),
                  //notes توضيح
                  Container(
                    height: 200.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blueGrey.shade500,
                            Colors.blueGrey.shade900,
                          ]
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(': توضيح ',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                          SizedBox(height: 3.0,),
                          Text('${notes[plus]}',style: TextStyle(color: Colors.white,fontSize: 17.0),),
                        ]
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  //buttons
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){
                        if(plus > 0){
                          setState(() {
                            plus -=1;
                          });
                        }
                        else
                        {
                          setState(() {
                            plus = learn.length-1;
                          });
                        }
                      }, icon: Icon(Icons.arrow_circle_left,size: 65,color: Colors.white70,)),
                      SizedBox(width: 40.0,),
                      IconButton(onPressed: (){
                        if(plus < learn.length-1){
                          setState(() {
                            plus +=1;
                          });
                        }
                        else
                        {
                          setState(() {
                            plus = 0;
                          });
                        }
                      }, icon: Icon(Icons.arrow_circle_right,size: 65,color: Colors.white70,)),
                      SizedBox(width: 30.0,),
                    ]
                  ),
                ]
            )
          ),
        ),
      ),
    );
  }
}


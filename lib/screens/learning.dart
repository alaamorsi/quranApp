import 'package:flutter/material.dart';
import 'package:quran_app/our_widgets.dart';
import 'package:quran_app/screens/learning2.dart';

class LearningScreen extends StatefulWidget {
  @override
  State<LearningScreen> createState() =>LearningScreenState();
}

class LearningScreenState extends State<LearningScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'تعلم'),
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
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Learning2Screen(title: 'تعلم الوضوء')));
                },
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.blueGrey.shade700
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image: AssetImage('assets/wash_and_pray/howWash2.jpg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('تعلم الوضوء',style: TextStyle(color: Colors.white,fontSize: 25.0),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0,),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Learning2Screen(title: 'تعلم الصلاة')));
                },
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blueGrey.shade700
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image: AssetImage('assets/wash_and_pray/howPray.jpg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('تعلم الصلاة',style: TextStyle(color: Colors.white,fontSize: 25.0),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:quran_app/quran_list.dart';

class ElQuraaScreen extends StatelessWidget {
  var nameController = TextEditingController();
  List elQuraaimages = ['assets/images/1.png','assets/images/2.jpg','assets/images/3.jpg'];
  List elQuraaNames = ["عبدالباسط عبد الصمد","محمد صديق المنشاوي ","ياسر الدوسري"];
  List url =['13.mp3quran.net/basit_mjwd','10.mp3quran.net/minsh','10.mp3quran.net/minsh'];
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
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context , index)=>buildElquraaItem(context , index),
                    separatorBuilder: (context , index)=> SizedBox(height: 10.0,),
                    itemCount: elQuraaNames.length
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildElquraaItem(context , index) => InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => QuranListView(elQuraa: url[index],Qname: elQuraaNames[index],)));
        },
        child: Container(
          height: 250.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0,),color: Colors.brown.shade800,),
            child: Column(
              children:
              [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0,),
                      image: DecorationImage(
                          image: AssetImage(elQuraaimages[index]),fit: BoxFit.cover),),
              ),
                ),
                Text(elQuraaNames[index],style: TextStyle(color: Colors.white, fontSize: 22.0)),
          ]
       ),
    ),
  );
}

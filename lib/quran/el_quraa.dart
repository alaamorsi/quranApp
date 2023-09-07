import 'package:flutter/material.dart';
import 'package:quran_app/material.dart';
import 'package:quran_app/our_widgets.dart';
import 'package:quran_app/quran/quran_list.dart';
import 'package:quran_app/quran/search_of_sheikh.dart';

class ElQuraaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تلاوت القرآن الكريم',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
        ),
        actions: [IconButton(onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => SearchOfSheikh()));
        }, icon: Icon(Icons.search))],
        centerTitle: true,
        backgroundColor: Colors.brown.shade900,
        elevation: 0.0,
      ),
      body: Container(
        height: double.infinity,
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
                    itemBuilder: (context, index) =>
                        justItem(context: context, from: allReaders, index: index, navScreen: QuranListView(shaikh: allReaders[index]),),
                    separatorBuilder: (context, index) => SizedBox(height: 10.0,),
                    itemCount: allReaders.length),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildElquraaItem(context, index) => Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0,), color: Colors.brown[800],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QuranListView(shaikh: allReaders[index])));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0,),
                    color: Colors.white,),
                  child: Icon(Icons.add,color: Colors.brown),
                ),
                Spacer(),
                Text(
                  allReaders[index].name,
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
                SizedBox(width: 5.0,),
              ],
            ),
          ),
        ),
      );
}

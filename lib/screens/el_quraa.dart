import 'package:flutter/material.dart';
import 'package:quran_app/material.dart';
import 'package:quran_app/our_widgets.dart';
import 'package:quran_app/screens/quran_list.dart';
import 'package:quran_app/screens/search_of_sheikh.dart';

class ElQuraaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'القراء',iconButton: true,icon: Icons.search,navScreen: SearchOfSheikh()),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blueGrey.shade300,
              Colors.blueGrey.shade600
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
                        qaraaItem(context: context, from: allReaders, index: index, navScreen: QuranListView(shaikh: allReaders[index]),),
                    separatorBuilder: (context, index) => SizedBox(height: 10.0,),
                    itemCount: allReaders.length),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

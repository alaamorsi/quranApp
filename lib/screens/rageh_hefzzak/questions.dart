import 'package:flutter/material.dart';
import 'package:quran_app/material.dart';
import 'package:quran_app/our_widgets.dart';

class Questions extends StatelessWidget {

  ChooseC chapter;
  late ChooseC chapterQ;
  Questions({required this.chapter , super.key}) {
    chapterQ = chapter;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'راجع حفظك'),
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blueGrey[400]!,
                        Colors.blueGrey[700]!,
                      ],
                    ),
                  ),
                  child: Center(child: Text('بسم الله الرحمن الرحيم',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),))),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quran_app/our_widgets.dart';

class Questions extends StatelessWidget {

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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class MushafScreen extends StatefulWidget {

  @override
  State<MushafScreen> createState() => _MushafScreenState();
}

class _MushafScreenState extends State<MushafScreen> {

  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/Mushaf.pdf'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        width: double.infinity,
        height: double.infinity,
        child: PdfView(
          controller: pdfController,
        ),
      ),
    );
  }
}

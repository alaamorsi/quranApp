import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class MushafScreen extends StatelessWidget {

  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/Mushaf.pdf'),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white54,
              Colors.white60,
            ],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: PdfView(
          reverse: true,
          controller: pdfController,
        ),
      );
  }
}

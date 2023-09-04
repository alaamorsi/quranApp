import 'package:flutter/material.dart';
import 'package:quran_app/side_bar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TestScreen extends StatefulWidget {

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  late PdfViewerController pdfViewerController;
  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();
  late PdfTextSearchResult searchResult;


  @override
  void initState() {
    pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.brown.shade900,
          elevation: 0.0,
          title: Text('المصحف',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons. bookmark,
                color: Colors.white,
              ),
              onPressed: () {
                pdfViewerKey.currentState?.openBookmarkView();
              },
            ),
          ]
      ),
      body: Column(
          children: [
            Expanded(
              flex: 8,
              child: SfPdfViewer.asset('assets/Mushaf.pdf',
                controller: pdfViewerController,
                key: pdfViewerKey,
                scrollDirection: PdfScrollDirection.horizontal,
                enableDoubleTapZooming: false,
                pageLayoutMode: PdfPageLayoutMode.single,
                currentSearchTextHighlightColor: Colors.yellow.withOpacity(0.6),
                otherSearchTextHighlightColor: Colors.yellow.withOpacity(0.3),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          pdfViewerController.previousPage();
                        },
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          pdfViewerController.nextPage();
                        },
                      )
                    ]
                ),
              ),
            ),
          ]
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:quran_app/cache_helper.dart';

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
    bool isMarked = CacheHelper.getData(key: 'isMarked')??false;
    return Scaffold(
      drawer: Drawer(
        child: ListView(),
      ),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.brown.shade900,
          elevation: 0.0,
          title: Text('المصحف',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons. bookmark,
                color: isMarked?Colors.blue:Colors.white,
              ),
              onPressed: ()
              {
                if (isMarked==true)
                {
                  setState(() {
                    int pageNumber = CacheHelper.getData(key: 'markedPage');
                    pdfController.animateToPage(pageNumber, duration: Duration(milliseconds: 250), curve: Curves.ease);
                    CacheHelper.saveData(key: 'isMarked', value: false);

                  });
                }
                else
                {
                  setState((){
                    CacheHelper.saveData(key: 'markedPage', value: pdfController.page.toInt());
                    CacheHelper.saveData(key: 'isMarked', value: true);
                  });
                }
              },
            ),
          ]
      ),
      body: Container(
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
          child: Column(
            children: [
              Expanded(
                child: PdfView(
                  reverse: true,
                  controller: pdfController,
                  renderer: (PdfPage page) => page.render(
                    width: page.width *1.1,
                    height: page.height * 1.3,
                    format: PdfPageImageFormat.jpeg,
                    backgroundColor: '#FFFFFF',
                  ),
                ),
              ),
              Container(
                height: 60.0,
                color: Colors.brown,
                child: Row(
                    children: [
                      SizedBox(width: 15.0,),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          pdfController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeIn);
                        },
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          pdfController.previousPage(duration: Duration(milliseconds: 250), curve: Curves.easeOut);
                        },
                      ),
                      SizedBox(width: 15.0,),
                    ]
                ),
              ),
            ]
          ),
        ),
    );
  }
}

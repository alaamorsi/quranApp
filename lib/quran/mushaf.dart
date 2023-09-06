import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:quran_app/cache_helper.dart';
import '../material.dart';

class MushafScreen extends StatefulWidget {

  @override
  State<MushafScreen> createState() => _MushafScreenState();
}

class _MushafScreenState extends State<MushafScreen> {

  List<QuranChapter> quran = hollyQuraan;
  List<bool> select = [
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false,
  ];
  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/Mushaf.pdf'),
  );

  @override
  Widget build(BuildContext context) {
    bool isMarked = CacheHelper.getData(key: 'isMarked') ?? false;
    return Scaffold(
      endDrawer: Drawer(
        semanticLabel: 'lable',
        width: 180.0,
        child: ListView.separated(
          itemBuilder: (context, index) =>
              indexing(currentChapter: quran, isHere: select, index: index),
          separatorBuilder: (context, index) =>
              Container(height: 1, color: Colors.white70,),
          itemCount: quran.length,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown.shade900,
        elevation: 0.0,
        title: Text('المصحف',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),),
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
                  // renderer: (PdfPage page) => page.render(
                  //   width: page.width *1.1,
                  //   height: page.height * 1.3,
                  // ),
                  onPageChanged: (page) {
                    onChange(currentChapter: quran, isHere: select, page: page);
                  },
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
                          Icons.bookmark,
                          color: isMarked ? Colors.blue : Colors.white,
                        ),
                        onPressed: () {
                          if (isMarked == true) {
                            setState(() {
                              int pageNumber = CacheHelper.getData(
                                  key: 'markedPage');
                              pdfController.jumpToPage(pageNumber);
                              CacheHelper.saveData(
                                  key: 'isMarked', value: false);
                            });
                          }
                          else {
                            setState(() {
                              int pageNumber = pdfController.page;
                              CacheHelper.saveData(
                                  key: 'markedPage', value: pageNumber);
                              CacheHelper.saveData(
                                  key: 'isMarked', value: true);
                            });
                          }
                        },
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          pdfController.nextPage(
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeIn);
                        },
                      ),
                      SizedBox(width: 15.0,),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          pdfController.previousPage(
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeOut);
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

  Widget indexing({
    required List<QuranChapter> currentChapter,
    required List<bool> isHere,
    required int index}) =>
      ListTile(
        selected: isHere[index] ? true : false,
        tileColor: Colors.brown,
        title: Center(child: Text(currentChapter[index].nameArabic,
          style: TextStyle(fontSize: 18.0,
              color: isHere[index] ? Colors.brown : Colors.white),)),
        onTap: () {
          pdfController.jumpToPage(currentChapter[index].pageNumber);
          onChange(currentChapter: currentChapter,
              isHere: isHere,
              page: currentChapter[index].pageNumber);
        },
      );

  void onChange({
    required List<QuranChapter> currentChapter,
    required List<bool> isHere,
    required int page}) {
    for (int i = 1; i < quran.length; i++) {
      if (page >= currentChapter[i].pageNumber && page < currentChapter[i + 1].pageNumber) {
        for (int j = 0; j < isHere.length; j++) {
          if (j != i) {
            isHere[j] = false;
          }
          else {
            continue;
          }
        }
        setState(() {
          isHere[i] = true;
        });
        break;
      }
      else if (page == currentChapter[i].pageNumber) {
        for (int j = 0; j < isHere.length; j++) {
          if (isHere[j] && page != currentChapter[j].pageNumber) {
            isHere[j] = false;
          }
          else if (!isHere[j] && page == currentChapter[j].pageNumber) {
            isHere[j] = true;
          }
        }
        setState(() {
          isHere[i] = true;
        });
      }
      else {
        setState(() {
          isHere[i] = false;
        });
      }
    }
  }
}

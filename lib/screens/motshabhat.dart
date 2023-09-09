import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import '../cache_helper.dart';
import '../consts.dart';
import '../material.dart';

class MotshabhatScreen extends StatefulWidget {

  @override
  State<MotshabhatScreen> createState() => MotshabhatScreenState();
}

class MotshabhatScreenState extends State<MotshabhatScreen> {
  List<Motshabhat> allQuraanMotshabhat = quraanMotshabhat;
  List<bool> select = [
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false,
  ];

  final String pdfAssetPath = 'assets/motshabhat.pdf';
  final Completer<PDFViewController> _pdfViewController = Completer<PDFViewController>();
  late PDFViewController shot;

  @override
  Widget build(BuildContext context) {
    haveBookMark = CacheHelper.getData(key: 'haveBookMark')??false;
    int markedPage = CacheHelper.getData(key: 'motshabhatMark')??0;

    return Scaffold(
      // appBar: myAppBar(context: context, title: 'المتشابهات'),
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed:()async{
          await CacheHelper.saveData(key: 'haveBookMark', value: haveBookMark);
          await CacheHelper.saveData(key: 'motshabhatMark', value: markedPage);
          Navigator.pop(context);
        },),
        title: Text(
          'المتشابهات',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),),
        centerTitle: true,
        elevation: 5.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: cardColor,
          ),
        ),
      ),
      endDrawer: Drawer(
        width: 180.0,
        child: ListView.separated(
          itemBuilder: (context, index) => indexing(chapter:allQuraanMotshabhat, isHere: select, index: index),
          separatorBuilder: (context, index) => Container(height: 1, color: Colors.white70,),
          itemCount: quraanMotshabhat.length,
        ),
      ),
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        defaultPage: markedPage,
        onPageChanged: (int? current, int? total) =>
            onChange(chapter: allQuraanMotshabhat, isHere: select, page: current!+1),
        onViewCreated: (PDFViewController pdfViewController) async {
          _pdfViewController.complete(pdfViewController);
          shot = pdfViewController;
        },
      ).fromAsset(pdfAssetPath),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _pdfViewController.future,
        builder: (_, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      heroTag: 'bookmark',
                      child: Icon(Icons.bookmark_add),
                      onPressed: () async {
                        int currentPage = shot.getCurrentPage() as int;
                        if (haveBookMark == true) {
                          setState(() {
                            shot.setPage(currentPage);
                          });
                        } else {
                          setState(() {
                            haveBookMark= !haveBookMark;
                            markedPage = currentPage;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget indexing({
    required List<Motshabhat> chapter,
    required List<bool> isHere,
    required int? index}) =>
      ListTile(
        selected: isHere[index!] ? true : false,
        selectedTileColor: Colors.blueGrey.shade900,
        tileColor: Colors.blueGrey,
        title: Center(child: Text(chapter[index].nameArabic,
          style: TextStyle(fontSize: 18.0, color:Colors.white),)),
        onTap: () async{
          int page = chapter[index].pageNumber-1;
          onChange(chapter: chapter, isHere: isHere, page: chapter[index].pageNumber);
          shot.setPage(page);
        },
      );

  void onChange({
    required List<Motshabhat> chapter,
    required List<bool> isHere,
    required int page}) {
    for (int i = 0; i < chapter.length; i++) {
      if (page >= chapter[i].pageNumber && page < chapter[i + 1].pageNumber) {
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
      else if (page == chapter[i].pageNumber) {
        for (int j = 0; j < isHere.length; j++) {
          if (page == chapter[j].pageNumber) {
            setState(() {
              isHere[j] = true;
            });
          }
          else{
            setState(() {
              isHere[j] = false;
            });
          }
        }
        break;
      }
      else {
        setState(() {
          isHere[i] = false;
        });
      }
    }
  }
}
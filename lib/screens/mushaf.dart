import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:quran_app/cache_helper.dart';
import '../consts.dart';
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
  final String pdfAssetPath = 'assets/Mushaf.pdf';
  final Completer<PDFViewController> _pdfViewController = Completer<PDFViewController>();
  @override
  Widget build(BuildContext context) {
    haveQuranBM = CacheHelper.getData(key: 'haveQuranBM')??false;
    int markedPage = CacheHelper.getData(key: 'mushafMark')??null;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed:()async{
          await CacheHelper.saveData(key: 'haveQuranBM', value: haveQuranBM);
          await CacheHelper.saveData(key: 'mushafMark', value: markedPage);
          Navigator.pop(context);
        },),
        title: Text(
          'لمصحف',
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
          itemBuilder: (context, index) => indexing(chapter:quran, isHere: select, index: index),
          separatorBuilder: (context, index) => Container(height: 1, color: Colors.white70,),
          itemCount: quraanMotshabhat.length,
        ),
      ),
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        defaultPage: quraanMotshabhat[0].pageNumber,
        onPageChanged: (int? current, int? total) =>
            indexing(chapter: quran, isHere: select, index: current),
        onViewCreated: (PDFViewController pdfViewController) async {
          _pdfViewController.complete(pdfViewController);
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
                FloatingActionButton(
                  heroTag: 'haveQuranBM',
                  child: Icon(Icons.bookmark_add),
                  onPressed: () async {
                    final PDFViewController pdfController = snapshot.data!;
                    final int currentPage = (await pdfController.getCurrentPage())!;
                    if (haveQuranBM == true) {
                      await pdfController.setPage(currentPage);
                    }
                    else {
                      setState(() {
                        haveQuranBM= !haveQuranBM;
                        markedPage = currentPage;
                      });
                    }
                  },
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
    required List<QuranChapter> chapter,
    required List<bool> isHere,
    required int? index}) =>
      ListTile(
        selected: isHere[index!] ? true : false,
        tileColor: Colors.brown,
        title: Center(child: Text(chapter[index].nameArabic,
          style: TextStyle(fontSize: 18.0,
              color: isHere[index] ? Colors.brown : Colors.white),)),
        onTap: () async{
          onChange(chapter: chapter,
              isHere: isHere,
              page: chapter[index].pageNumber);
        },
      );

  void onChange({
    required List<QuranChapter> chapter,
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

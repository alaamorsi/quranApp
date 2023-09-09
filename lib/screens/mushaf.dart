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
  List<bool> isSelect = [
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
  late PDFViewController shot;

  @override
  Widget build(BuildContext context) {
    haveQuranBM = CacheHelper.getData(key: 'haveQuranBM')??false;
    int markedPage = CacheHelper.getData(key: 'mushafMark')??0;
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
          itemBuilder: (context, index) => indexing(chapter:quran, isHere: isSelect, index: index),
          separatorBuilder: (context, index) => Container(height: 1, color: Colors.white70,),
          itemCount: quran.length,
        ),
      ),
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        defaultPage: markedPage,
        onPageChanged: (int? current, int? total) =>
            onChange(chapter: quran, isHere: isSelect,page: current!+1),
        onViewCreated: (PDFViewController pdfViewController) async {
          _pdfViewController.complete(pdfViewController);
          shot = pdfViewController;
        },
      ).fromAsset(pdfAssetPath),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _pdfViewController.future,
        builder: (_, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            // final PDFViewController pdfController = snapshot.data!;
            // shot = pdfController ;
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: 'haveQuranBM',
                  child: Icon(Icons.bookmark_add),
                  onPressed: () {
                    int currentPage = shot.getCurrentPage() as int;
                    if (haveQuranBM == true) {
                      setState(() {
                        shot.setPage(currentPage);
                      });
                    }else {
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
        selectedTileColor: Colors.blueGrey.shade900,
        tileColor: Colors.blueGrey,
        title: Center(child: Text(chapter[index].nameArabic,
          style: TextStyle(fontSize: 18.0, color:Colors.white),)),
        onTap: () {
          int page = chapter[index].pageNumber-1;
          onChange(chapter: chapter, isHere: isHere, page: chapter[index].pageNumber);
          shot.setPage(page);
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

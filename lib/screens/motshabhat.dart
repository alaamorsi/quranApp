import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:quran_app/our_widgets.dart';
import '../material.dart';

class MotshabhatScreen extends StatefulWidget {

  @override
  State<MotshabhatScreen> createState() => MotshabhatScreenState();
}

class MotshabhatScreenState extends State<MotshabhatScreen> {

  List<Motshabhat> motshabhat = quraanMotshabhat;
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
  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/motshabhat.pdf'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        width: 180.0,
        child: ListView.separated(
          itemBuilder: (context, index) =>
              indexing(motshabhat: motshabhat, isHere: select, index: index),
          separatorBuilder: (context, index) =>
              Container(height: 1, color: Colors.white70,),
          itemCount: motshabhat.length,
        ),
      ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.brown.shade900,
      //   elevation: 0.0,
      //   title: Text('المصحف',
      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),),
      // ),
      appBar: myAppBar(context: context, title: 'متشابهات'),
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
                    onChange(motshabhat: motshabhat, isHere: select, page: page);
                    pdfController.initialPage=2;
                  },
                ),
              ),
              Container(
                height: 60.0,
                color: Colors.brown,
                child: Row(
                    children: [
                      SizedBox(width: 15.0,),
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
    required List<Motshabhat> motshabhat,
    required List<bool> isHere,
    required int index}) =>
      ListTile(
        selected: isHere[index] ? true : false,
        tileColor: Colors.brown,
        title: Center(child: Text(motshabhat[index].nameArabic,
          style: TextStyle(fontSize: 18.0,
              color: isHere[index] ? Colors.brown : Colors.white),)),
        onTap: () {
          pdfController.jumpToPage(motshabhat[index].pageNumber);
          onChange(motshabhat: motshabhat,
              isHere: isHere,
              page: motshabhat[index].pageNumber);
        },
      );

  void onChange({
    required List<Motshabhat> motshabhat,
    required List<bool> isHere,
    required int page}) {
    for (int i = 0; i < motshabhat.length; i++) {
      if (page >= motshabhat[i].pageNumber && page < motshabhat[i + 1].pageNumber) {
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
      else if (page == motshabhat[i].pageNumber) {
        for (int j = 0; j < isHere.length; j++) {
          if (page == motshabhat[j].pageNumber) {
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

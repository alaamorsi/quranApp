// ignore_for_file: sort_child_properties_last, prefer_const_constructors
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/screens/quran_screen.dart';
import '../material.dart';

// ignore: must_be_immutable
class SearchOfQuran extends StatefulWidget {

  AlShaikh shaikh;
  late AlShaikh shaikhQ;

  SearchOfQuran({required this.shaikh,super.key}) {
    shaikhQ = shaikh;
  }

  @override
  State<SearchOfQuran> createState() => _SearchOfQuranState();
}

class _SearchOfQuranState extends State<SearchOfQuran> {

  TextEditingController searchController = TextEditingController();

  List<QuranChapter> quraan = hollyQuraan;
  List<QuranChapter> searchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(
        title: Text(
          'البحث',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade700,
        elevation: 0.0,
      ),
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    controller: searchController,
                    cursorColor: Colors.blueGrey.shade100,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,color: Colors.blueGrey.shade700,),
                      hintText: '  ابحث عن السورة',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.blueGrey.shade900,width: 2.0,),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.white,),
                      ),
                    ),
                    onChanged: (v) {
                      setState(() {
                        searchList = [];
                      });
                      for (int i = 0; i < quraan.length; i++) {
                        final soraName = quraan[i].nameArabic;
                        final input = v;

                        if (soraName.contains(input)) {
                          setState(() {
                            searchList.add(quraan[i]);
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20.0,),
                  ConditionalBuilder(
                    condition: searchList.isNotEmpty,
                    builder: (BuildContext context) =>
                        ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                buildQuranItem(searchList[index], widget.shaikh),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10.0,),
                            itemCount: searchList.length)
                    , fallback: (BuildContext context) => Container(),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }

  Widget buildQuranItem(QuranChapter chapter, AlShaikh shaikh) =>
      Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0,), color: Colors.blueGrey.shade700,
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    QuranScreen(chapter: chapter, shaikh: shaikh)));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0,),
                    color: Colors.white,),
                  child: Icon(Icons.add,color: Colors.blueGrey),
                ),
                Spacer(),
                Text(
                  ' سورة ${chapter.nameArabic}',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ],
            ),
          ),
        ),
      );
}
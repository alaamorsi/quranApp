// ignore_for_file: sort_child_properties_last, prefer_const_constructors
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/quran_screen.dart';
import 'material.dart';

class SearchScreen extends StatefulWidget {

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchController = TextEditingController();

  AlShaikh shaikhy=AlShaikh(name: 'عبدالباسط عبدالصمد', image: 'assets/images/1.png', url: '13.mp3quran.net/basit_mjwd');

  List<QuranChapter> quraan= hollyQuraan;
  List<QuranChapter> searchList =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.brown.shade300,
      appBar: AppBar(
        title: Text(
          'البحث',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown.shade900,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'قرأن كريم',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.brown.shade900),
                      ),
                  ),
                  onChanged: (v) {
                    setState(() {
                      searchList=[];
                    });
                      for(int i =0 ;i < quraan.length;i++)
                      {
                        final soraName = quraan[i].nameArabic;
                        final input =v;

                        if(soraName.contains(input))
                        {
                          setState(() {
                            searchList.add(quraan[i]);
                          });
                        }
                      }
                    },
                ),
                SizedBox(height: 20.0,),
                ConditionalBuilder(
                  condition: quraan.isNotEmpty,
                  builder: (BuildContext context) =>
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>buildItem(searchList[index], shaikhy),
                        separatorBuilder: (context, index) => SizedBox(height: 10.0,),
                        itemCount: searchList.length,
                      ),
                  fallback: (BuildContext context) => Container(),
                ),
              ]
          ),
        ),
      ),
    );
  }

  Widget buildItem(QuranChapter chapter,AlShaikh shaikh) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0,),color: Colors.brown[800],
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
            Icon(Icons.arrow_back),
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
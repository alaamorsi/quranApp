// ignore_for_file: sort_child_properties_last, prefer_const_constructors
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/screens/quran_list.dart';
import '../material.dart';

class SearchOfSheikh extends StatefulWidget {

  @override
  State<SearchOfSheikh> createState() => _SearchOfSheikhState();
}

class _SearchOfSheikhState extends State<SearchOfSheikh> {

  TextEditingController searchController = TextEditingController();

  List<AlShaikh> readers=allReaders;
  List<AlShaikh> searchList=[];

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
                  cursorColor: Colors.brown.shade900,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,color: Colors.brown.shade900,),
                    hintText: '  ابحث عن القارئ',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.brown.shade900,width: 2.0,),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.white,),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: (v) {
                    setState(() {
                      searchList=[];
                    });
                    for(int i =0 ;i < readers.length;i++)
                    {
                      final readerName = readers[i].name;
                      final input =v;

                      if(readerName.contains(input))
                      {
                        setState(() {
                          searchList.add(readers[i]);
                        });
                      }
                    }
                  },
                ),
                SizedBox(height: 20.0,),
                ConditionalBuilder(
                  condition: searchList.isNotEmpty,
                  builder: (BuildContext context)=>
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index)=>buildElquraaItem(searchList[index]),
                          separatorBuilder: (context, index) =>SizedBox(height: 10.0,),
                          itemCount: searchList.length)
                  , fallback: (BuildContext context) => Container(),
                ),
              ]
          ),
        ),
      ),
    );
  }
  Widget buildElquraaItem(AlShaikh shaikh) => Container(
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        20.0,
      ),
      color: Colors.brown[800],
    ),
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuranListView(shaikh: shaikh)));
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
              child: Icon(Icons.add,color: Colors.brown),
            ),
            Spacer(),
            Text(
              '${shaikh.name}',
              style: TextStyle(color: Colors.white, fontSize: 22.0),
            ),
            SizedBox(width: 5.0,),
          ],
        ),
      ),
    ),
  );
}
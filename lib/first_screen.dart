import 'package:flutter/material.dart';
import 'package:quran_app/azkaar.dart';
import 'package:quran_app/el_quraa.dart';
import 'package:quran_app/material.dart';
import 'package:quran_app/mushaf.dart';
import 'package:quran_app/quran_screen.dart';
import 'package:quran_app/search_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'القرآن الكريم',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
        ),
        actions: [IconButton(onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => SearchScreen()));
        }, icon: Icon(Icons.search))],
        centerTitle: true,
        backgroundColor: Colors.brown.shade900,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.brown[200]!,
              Colors.brown,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //for the image
              Container(height: 300,
                width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: AssetImage('assets/AppImage.jpg')
                        ,fit: BoxFit.cover),
                  ),
              ),
              SizedBox(height: 20.0,),
              //for the first button
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ElQuraaScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.brown[400]!,
                          Colors.brown[700]!,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(child: Text('الأستماع',style: TextStyle(color: Colors.white,fontSize: 22.0),)),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              //for the second button
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MushafScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.brown[400]!,
                          Colors.brown[700]!,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(child: Text('المصحف',style: TextStyle(color: Colors.white,fontSize: 22.0),)),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              //therd button
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AzkaarScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.brown[400]!,
                          Colors.brown[700]!,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(child: Text('الأذكار',style: TextStyle(color: Colors.white,fontSize: 22.0),)),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}

class searchFun extends SearchDelegate{
  List<QuranChapter> quraan= hollyQuraan;
  List<String> sug= [
    'سورة الفاتحة',
    'سورة البقرة',
  ];
  @override
  Widget? buildLeading(BuildContext context)=>IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: (){
      close(context, null);
    },
  );

  @override
  List<Widget>? buildActions(BuildContext context)=> [ IconButton(
    icon: Icon(Icons.clear),
    onPressed: (){
      if(query.isEmpty)
      {
        close(context, null);
      }
      else{
        query='';
      }
    },
  ),
  ];

  @override
  Widget buildResults(BuildContext context) {
    List<QuranChapter> results = quraan.where((searchResult){
      final result = searchResult.nameArabic;
      final input = query;
      return result.contains(input);
    }).toList();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.brown[200]!,
            Colors.brown,
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
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=>Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0,), color: Colors.brown[800],
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QuranScreen(chapter: results[index], shaikh: allReaders[index])));
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
                            '${results[index].nameArabic}',
                            style: TextStyle(color: Colors.white, fontSize: 22.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context,index)=> SizedBox(height: 5.0,),
                itemCount: results.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = sug.where((sugResult){
      final result = sugResult;
      final input = query;

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context,index)
      {
        final suggestion= suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: ()
          {
            query=suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}


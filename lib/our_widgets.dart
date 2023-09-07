import 'package:flutter/material.dart';

////////////////////////////////////////////
PreferredSizeWidget myAppBar({
  required BuildContext context,
  required String title,
  String backImage ='assets/background/b0.jpg',
  bool iconButton =false,
  IconData? icon,
  navScreen})=>AppBar(
  title: Text(
    title,
    style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'nor', fontSize: 28.0),),
  actions: [
    if(iconButton)
      IconButton(
          onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => navScreen));},
          icon: Icon(icon)
      ),
  ],
  centerTitle: true,
  elevation: 5.0,
  flexibleSpace: Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(backImage),
            fit: BoxFit.cover
        )
    ),
  ),
);

//////////////////////////////////////////////////////////////
Widget firstScreenItem({required context,required String title,required IconData icon ,required  navTo})=>
    Expanded(
      child: InkWell(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => navTo));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(image: AssetImage('assets/background/b3.jpg'),fit: BoxFit.cover),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(icon,size: 30.0,color: Colors.white,),
                    SizedBox(height: 5.0,),
                    Text(title,style: TextStyle(color: Colors.white,fontFamily: 'nor',fontSize: 21.0),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

///////////////////////////////////////////////////////////
Widget firstScreenItemV({required context,required String title,required IconData icon ,required  navTo})=>
    Expanded(
      child: InkWell(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => navTo));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(image: AssetImage('assets/background/b3.jpg'),fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(icon,size: 35.0,color: Colors.white,),
                    Spacer(),
                    Text(title,style: TextStyle(color: Colors.white,fontFamily: 'nor',fontSize: 22.0),),
                  ]
                ),
              ),
            ]
          ),
        ),
      ),
    );

//////////////////////////////////////
Widget qaraaItem({required context,required List from,required int index,required  navScreen})=>
    Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0,),
        image: DecorationImage(image: AssetImage('assets/background/b3.jpg'),fit: BoxFit.cover),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => navScreen));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0,),
                  color: Colors.white,),
                child: Icon(Icons.add,color: Colors.brown),
              ),
              Spacer(),
              Text(
                from[index].name,
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
              SizedBox(width: 5.0,),
            ],
          ),
        ),
      ),
    );

//////////////////////////////////////
Widget chapterItem({required context,required List from,required int index,required  navScreen})=>
    Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0,),
        image: DecorationImage(image: AssetImage('assets/background/b3.jpg'),fit: BoxFit.cover),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => navScreen));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0,),
                  color: Colors.white,),
                child: Icon(Icons.add,color: Colors.brown),
              ),
              Spacer(),
              Text(
                " سورة ${from[index].nameArabic}",
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
              SizedBox(width: 5.0,),
            ],
          ),
        ),
      ),
    );
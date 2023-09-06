import 'package:flutter/material.dart';

class Masbaha extends StatefulWidget {

  @override
  State<Masbaha> createState() => _MasbahaState();
}

class _MasbahaState extends State<Masbaha> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المسبحة',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),),
        centerTitle: true,
        backgroundColor: Colors.brown.shade900,
        elevation: 0.0,),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.brown.shade300,
                Colors.brown.shade600,
              ]
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Expanded(
              child: Container(
                height: 350.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.brown.shade900,
                  image: DecorationImage(image: AssetImage('assets/background/b2.jpg'),fit: BoxFit.cover),
                ),
                child: Column(
                  children:[
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        height: 170.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.grey.shade200,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('${counter}',style: TextStyle(fontSize: 90.0,color: Colors.grey.shade900),),
                              SizedBox(width: 10,),
                            ]
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 80,),
                        MaterialButton(
                          onPressed: (){
                            setState(() {
                              counter +=1;
                            });
                          },
                          shape: CircleBorder(),
                          color: Colors.brown.shade300,
                          minWidth: 70,height: 70,
                          child: Text('',style: TextStyle(fontSize: 60.0,color: Colors.grey),),
                        ),
                        SizedBox(width: 30,),
                        MaterialButton(
                          onPressed: (){
                            setState(() {
                              counter = 0;
                            });
                          },
                          shape: CircleBorder(),
                          color: Colors.brown.shade300,
                          minWidth:20,height: 20,
                          child: Text('.',style: TextStyle(fontSize: 10.0,color: Colors.grey),),
                        ),
                        SizedBox(width: 10,),
                      ]
                    )
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


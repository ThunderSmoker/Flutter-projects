import 'dart:html';
import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? data={};
  @override
  Widget build(BuildContext context){
    // data= (data?.isNotEmpty ?? false) ? data :ModalRoute.of(context)!.settings.arguments as Map?; // storing all received data in map
    data = ( data?.isNotEmpty ??false)?  data : ModalRoute.of(context)?.settings.arguments as Map?;
    // if(data!=null){
    // data= ModalRoute.of(context)?.settings?.arguments as Map?;
    //
    // }
    //set Background
   String bgimage='day.png';
    Color bgcolor=Colors.yellow;
   if(data?['isDayTime']!=null){
     if(data?['isDayTime']==true){
       bgimage='day.png';
       bgcolor=Colors.blue;
     }
     else{
       bgimage='night.png';
       bgcolor=Colors.redAccent;
     }
   }
    return Scaffold(
      backgroundColor: bgcolor,
      body:
        SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/$bgimage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: [
                  TextButton.icon(onPressed: ()async{
                  dynamic res=await  Navigator.pushNamed(context, '/location');
                  setState(() {
                    data={
                      'time':res['time'],
                      'location':res['location'],
                      'isDayTime':res['isDayTime'],
                      'flag':res['flag']
                    };
                  });
                  },
                  icon: Icon(Icons.edit_location,color: Colors.grey[300],),
                  label:
                  Text(
                      'Edit Locatiion',
                      style:TextStyle(color:Colors.grey[300]),
                  ),
                  ),
                  SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data?['location'],
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data?['time'],
                    style:TextStyle(
                      fontSize: 66,
                      color: Colors.white,
                    )
                  )

                ],
              ),
            ),
          )
        ),
    );
  }
}

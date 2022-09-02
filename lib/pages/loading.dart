import 'dart:html';
import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../services/worldtime.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {




  //String time='loading';// sets initial value
  void setWorldTime()async{
    WorldTime instance=WorldTime(location: 'Berlin', url: 'Europe/Berlin', flag:'germany.png');
    String time='loading';
    await instance.getTime();
    // setState(() {   // was to test backend
      time=await instance.time;
      String loc=await instance.location;
      String flag=await instance.flag;

    // });
    // redirect to home page
    //Navigator.pushNamed(context, '/home'); // stacks home on loading
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':loc,
      'time':time,
      'flag':flag,
      'isDayTime':instance.isDaytime
    });
  }


  // void getData()async{
  //
  //   var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');// to fetch data
  //   var response = await http.get(url);
  //   if (kDebugMode) {
  //     // print(response.body);// prints fetch data
  //     Map data=jsonDecode(response.body );
  //     print(data);
  //     print(data['title']);
  //   }


  @override
  void initState(){ // init func runs when the page loads for first time
    super.initState();
    setWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child:  const SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),



      );

  }
}

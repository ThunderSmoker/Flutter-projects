import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:io';

class WorldTime{
  late String location;// location name for ui
  late String time;
  late String flag;//url to assets flag icon of location
  late String url;//Location url for api endpoints
  bool isDaytime=true;

  WorldTime({required this.location,required this.url,required this.flag});

  Future<void> getTime()async{  // future keyword promises to get value of time until that wait
    try{



    //make request
    var urm=Uri.parse('http://worldtimeapi.org/api/timezone/$url');
    var response=await http.get(urm);
    if(kDebugMode){
      Map data=jsonDecode(response.body);
      // print(data);


      //get properties from data
      String datetime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);// to get desired offset in integer only i.e +01.00 to 01
      // print(datetime);
      // print(offset);
      DateTime now=DateTime.parse(datetime);// convert to datetime object to use its methods
      now=now.add(Duration(hours: int.parse(offset))); // to add offset to display correct time
       // time=now.toString();//set time property to string
      isDaytime=now.hour>6&& now.hour<20?true:false;
      time=DateFormat.jm().format(now);
    }

    }catch(e){
    print('caught error $e');
    time='could not get time data';
    }
  }
}

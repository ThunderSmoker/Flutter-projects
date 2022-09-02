import 'dart:js';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:worldclock/pages/chooselocation.dart';
import 'package:worldclock/pages/home.dart';
import 'package:worldclock/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/location':(context)=>ChooseLocation(),
    },
  ));
}

import 'package:api_demo2/Views/imageview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      home: ImageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
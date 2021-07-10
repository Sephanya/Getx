import 'package:api_demo2/getx_imageview_app/views/imageview.dart';
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
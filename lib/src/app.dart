import 'package:conection_api_admision/src/ui/movie_list.dart';
import 'package:conection_api_admision/src/ui/question_page.dart';
import 'package:flutter/material.dart';
//import '../ui/movie_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: QuestonPage(),
      ),
    );
  }
}
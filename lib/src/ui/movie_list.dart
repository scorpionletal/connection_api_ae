
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
    @override
  Widget build(BuildContext context) {

    //bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body:ListView() ,
    );
  }


}
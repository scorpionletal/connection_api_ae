import 'dart:async';
import 'package:conection_api_admision/src/models/prueba_model_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client, Response;
import 'dart:convert';

class QuestionApiProvider {
  Client client = Client();
  final String _url = 'http://18.231.108.158:8001/v1/vista1';

  QuestionApiProvider(){
    debugPrint('contructor');
  }

  Future<QuestionModel> fetchQuestionList() async{
    try{
      Response response = await client.get(_url);
      return QuestionModel.fromJson(json.decode(response.body));
    }catch (error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return QuestionModel.withError("Data not found / connection issue");
    }


  }

}


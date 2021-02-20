import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:conection_api_admision/src/models/prueba_model_item.dart';
import 'package:conection_api_admision/src/resources/repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final Repository _repository = Repository();

  QuestionBloc(QuestionState initialState) : super(QuestionInitial());


  @override
  Stream<QuestionState> mapEventToState(QuestionEvent event) async* {
        if(event is GetQuestionList){
          try {
            yield QuestionLoading();
            final mList = await _repository.fetchAllQuestion();
            yield QuestionLoaded(mList);
            if (mList.error != null) {
              yield QuestionError(mList.error);
            }  
          }on NetworkError {
            yield QuestionError("Faild to fetch data. is your device online");
          }
        }
  }
}

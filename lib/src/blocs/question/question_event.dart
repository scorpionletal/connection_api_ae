part of 'question_bloc.dart';

@immutable
abstract class QuestionEvent extends Equatable{
    const QuestionEvent();
}

class GetQuestionList extends QuestionEvent{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

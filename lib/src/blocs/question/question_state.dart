part of 'question_bloc.dart';

@immutable
abstract class QuestionState extends Equatable{
    const QuestionState();
}

class QuestionInitial extends QuestionState{
  const QuestionInitial();

  @override
  List<Object> get props => null;
}
class QuestionLoading extends QuestionState {
    const QuestionLoading();

    @override
  List<Object> get props => null;
}
class QuestionLoaded extends QuestionState {
  final QuestionModel questionModel;
  const QuestionLoaded(this.questionModel);

  @override
  // TODO: implement props
  List<Object> get props => [questionModel];
}
class QuestionError extends QuestionState{
  final String message;
  const QuestionError(this.message);

  @override
  List<Object> get props => [message];
}
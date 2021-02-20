import 'package:conection_api_admision/src/models/prueba_model_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conection_api_admision/src/blocs/question/question_bloc.dart';

class QuestonPage extends StatefulWidget{
  @override
  _QuestionPageState createState() => _QuestionPageState();

}
class _QuestionPageState extends State<QuestonPage>{
  final QuestionBloc _newsBloc = QuestionBloc(QuestionInitial());

  @override
  void initState() {
    _newsBloc.add(GetQuestionList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Preguntas y Respuestas')),
        body: _buildListQuestion(),
      );
  }

  Widget _buildListQuestion(){
    return Container(
        margin: EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (_)=> _newsBloc,
          child: BlocListener<QuestionBloc, QuestionState>(
            listener: (context, state){
              if (state is QuestionError) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            child: BlocBuilder<QuestionBloc, QuestionState>(
              builder: (context, state){
                if (state is QuestionInitial) {
                  return _buildLoading();
                }else if (state is QuestionLoading) {
                  return _buildLoading();
                }  else if (state is QuestionLoaded) {
                  return _buildCard(context, state.questionModel);
                }  else if (state is QuestionError) {
                  return Container();
                }
              },
            ),
          ),
        ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  Widget _buildCard(BuildContext context, QuestionModel questionModel) {
    return ListView.builder(
      itemCount: questionModel.preguntas.length,
      itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Pregunta: ${questionModel.preguntas[index].question}"),
                  Text("respuesta: ${questionModel.preguntas[index].answer}"),
                  Text("Categoria: ${questionModel.preguntas[index].category}"),
                  Text("dificultad: ${questionModel.preguntas[index].difficulty}"),
                  Card(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("http://${questionModel.preguntas[index].imgUrl}"),
            ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}

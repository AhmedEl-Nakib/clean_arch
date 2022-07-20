import 'package:equatable/equatable.dart';

// this is UIModel to show this model in UI
class NumberTrivia extends Equatable{

  final String text;
  final int number;

  NumberTrivia({ required this.text,required this.number}) : super([text , number]);
}
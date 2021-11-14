part of 'calculator_bloc.dart';

// @immutable
// abstract class CalculatorState {}

// class CalculatorInitial extends CalculatorState {}

class CalculatorState {
  final String mathResult;
  final String firtsNumber;
  final String secondNumber;
  final String operation;

  CalculatorState({
    this.mathResult = '10',
    this.firtsNumber = '20',
    this.secondNumber = '30',
    this.operation = '+'
  });
}
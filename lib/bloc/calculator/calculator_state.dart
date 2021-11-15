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

  CalculatorState copyWhit({
    String? mathResult,
    String? firtsNumber,
    String? secondNumber,
    String? operation,
  })=> CalculatorState(
    mathResult: mathResult??this.mathResult,
    firtsNumber: firtsNumber??this.firtsNumber,
    secondNumber: secondNumber??this.secondNumber,
    operation: operation??this.operation
  );
}
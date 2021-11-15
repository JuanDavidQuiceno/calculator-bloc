import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());
  // {
    // on<CalculatorEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  // }
  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  )async*{
    if(event is ResetAC){
      //yield* no emite stream, emite el valor que ese stream va a emitir
      yield* this._resetAC();
    }else if (event is AddNumber){
      yield state.copyWhit(
        mathResult: (state.mathResult =='0')
          ? event.number
          :state.mathResult + event.number
      );
    }else if(event is ChangeNegativePositive){
      yield state.copyWhit(
        mathResult: state.mathResult.contains('-')
          ?state.mathResult.replaceFirst('-', '')
          :'-'+state.mathResult
      );
    }else if(event is DeleteLastEntry){
      yield state.copyWhit(
        mathResult: state.mathResult.length>1
          ? state.mathResult.substring(0, state.mathResult.length-1)
          : '0'
      );
    }else if(event is OperationEntry){
      yield state.copyWhit(
        firtsNumber: state.mathResult,
        mathResult: '0',
        operation: event.operation,
      );
    }else if(event is CalculateResult){
      yield* _calculateResult();
    }
  }

  Stream<CalculatorState> _resetAC()async*{
    yield CalculatorState(
      firtsNumber: '0',
      secondNumber:'0',
      operation: '+',
      mathResult: '0',
    );
  }

  Stream<CalculatorState> _calculateResult()async*{
    final double num1 = double.parse(state.firtsNumber);
    final double num2 = double.parse(state.mathResult);
    switch (state.operation) {
      case '+':
        yield state.copyWhit(
          secondNumber: state.mathResult,
          mathResult: '${num1+num2}'
        );
        break;
      case '-':
        yield state.copyWhit(
          secondNumber: state.mathResult,
          mathResult: '${num1-num2}'
        );
        break;
      case 'X':
        yield state.copyWhit(
          secondNumber: state.mathResult,
          mathResult: '${num1*num2}'
        );
        break;
      case '/':
        yield state.copyWhit(
          secondNumber: state.mathResult,
          mathResult: '${num1+num2}'
        );
        break;
      default:
        yield state;
    }
  }
}

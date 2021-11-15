import 'package:calculadora/bloc/calculator/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'line_separator.dart';
import 'main_result.dart';
import 'sub_result.dart';

class ResultsLabel extends StatelessWidget {
  const ResultsLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        if(state.firtsNumber == '0'&&state.secondNumber=='0'){
          return _result(context, state);
        }
        return Column(
          children: [
            SubResult(
              text: state.firtsNumber.endsWith('.0')
                ?state.firtsNumber.substring(0, state.firtsNumber.length-2)
                :state.firtsNumber
            ),
            SubResult(
              text: state.operation
            ),
            SubResult(
              text: state.secondNumber.endsWith('.0')
                ?state.secondNumber.substring(0, state.secondNumber.length-2)
                :state.secondNumber
            ),
            LineSeparator(),
            _result(context, state)
          ],
        );
      },
    );
  }

  Widget _result(BuildContext context, CalculatorState state)=>MainResultText(
    text: state.mathResult.endsWith('.0')
      ?state.mathResult.substring(0, state.mathResult.length-2)
      :state.mathResult
  );
}

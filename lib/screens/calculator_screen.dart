import 'package:flutter/material.dart';
import 'package:calculadora/bloc/calculator/calculator_bloc.dart';
import 'package:calculadora/widgets/results_label.dart';
import 'package:calculadora/widgets/calc_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final blocCalculator = BlocProvider.of<CalculatorBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric( horizontal: 10 ),
          child: Column(
            children: [
              
              Expanded(
                child: Container(),
              ),
              ResultsLabel(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: 'AC',
                    bgColor: Color(0xffA5A5A5 ),
                    onPressed: () => blocCalculator.add(ResetAC()),
                  ),
                  CalculatorButton( 
                    text: '+/-',
                    bgColor: Color(0xffA5A5A5 ),
                    onPressed: () => blocCalculator.add(ChangeNegativePositive()),
                  ),
                  CalculatorButton( 
                    text: 'del',
                    bgColor: Color(0xffA5A5A5 ),
                    onPressed: () => blocCalculator.add(DeleteLastEntry()),
                  ),
                  CalculatorButton( 
                    text: '/',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => blocCalculator.add(OperationEntry('/')),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: '7',
                    onPressed: () => blocCalculator.add(AddNumber('7')),
                  ),
                  CalculatorButton( 
                    text: '8',
                    onPressed: () =>blocCalculator.add(AddNumber('8')),
                  ),
                  CalculatorButton( 
                    text: '9',
                    onPressed: () => blocCalculator.add(AddNumber('9')),
                  ),
                  CalculatorButton( 
                    text: 'X',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => blocCalculator.add(OperationEntry('X')),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: '4', 
                    onPressed: () =>blocCalculator.add(AddNumber('4')),
                  ),
                  CalculatorButton( 
                    text: '5', 
                    onPressed: () => blocCalculator.add(AddNumber('5')),
                  ),
                  CalculatorButton( 
                    text: '6', 
                    onPressed: () => blocCalculator.add(AddNumber('6')),
                  ),
                  CalculatorButton( 
                    text: '-',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => blocCalculator.add(OperationEntry('-')),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: '1', 
                    onPressed: () => blocCalculator.add(AddNumber('1')),
                  ),
                  CalculatorButton( 
                    text: '2', 
                    onPressed: () => blocCalculator.add(AddNumber('2')),
                  ),
                  CalculatorButton( 
                    text: '3', 
                    onPressed: () => blocCalculator.add(AddNumber('3')),
                  ),
                  CalculatorButton(
                    text: '+',  
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => blocCalculator.add(OperationEntry('+')),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: '0', 
                    big: true,
                    onPressed: () => blocCalculator.add(AddNumber('0')),
                  ),
                  CalculatorButton( 
                    text: '.', 
                    onPressed: () =>  blocCalculator.add(AddNumber('.')),
                  ),
                  CalculatorButton( 
                    text: '=',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () =>blocCalculator.add(CalculateResult()),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
   );
  }
}
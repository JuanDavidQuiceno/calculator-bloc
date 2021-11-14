import 'package:flutter/material.dart';

import 'line_separator.dart';
import 'main_result.dart';
import 'sub_result.dart';

class ResultsLabel extends StatelessWidget {
  const ResultsLabel({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubResult( text: '1000' ),
        SubResult( text: 'X' ),
        SubResult( text: '1000' ),
        LineSeparator(),
        MainResultText( text: '2000' ),
      ],
    );
  }
}
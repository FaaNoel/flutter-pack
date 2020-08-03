import 'dart:async';
import 'package:flutter/material.dart';

class BoundText extends StatelessWidget {
  BoundText(
    this.stream, {
    this.style,
  });

  final Stream<dynamic> stream;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: stream,
      builder: (context, snapshot){
        return Text(snapshot.data.toString(), style: style);
      },
    );
  }
}

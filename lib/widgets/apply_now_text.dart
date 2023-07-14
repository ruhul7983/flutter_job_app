import 'package:flutter/material.dart';

class ApplyNowText extends StatelessWidget {
  final String text;
  final double frontSize;
  final FontWeight frontWeight;
  final Color? color;
  const ApplyNowText({Key? key, required this.text, required this.frontSize, required this.frontWeight, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text,style: TextStyle(fontWeight: frontWeight,fontSize: frontSize,color: color),),
    );
  }
}

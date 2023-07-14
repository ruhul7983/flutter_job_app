import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Color? color;
  const AuthButton({Key? key, required this.text, this.color=Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}

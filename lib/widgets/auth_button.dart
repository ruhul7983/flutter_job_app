import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  const AuthButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}

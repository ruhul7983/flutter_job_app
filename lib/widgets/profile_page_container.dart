import 'package:flutter/material.dart';

import '../main.dart';

class ProfilePageText extends StatelessWidget {
  final String text;
  final Icon icon;
  const ProfilePageText({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(

            height: mq.height * 0.09,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFebe8e8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  icon,
                  SizedBox(width: mq.width * 0.05,),
                  Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

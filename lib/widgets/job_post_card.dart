import 'package:flutter/material.dart';

import '../main.dart';

class JobPostCard extends StatefulWidget {
  const JobPostCard({Key? key}) : super(key: key);

  @override
  State<JobPostCard> createState() => _JobPostCardState();
}

class _JobPostCardState extends State<JobPostCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
      child: Container(
        height: mq.height * 0.25,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
    );
  }
}

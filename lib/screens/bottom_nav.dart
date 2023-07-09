import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/utils/colors.dart';

import 'bottom_nav/add_job.dart';
import 'bottom_nav/all_jobs.dart';
import 'bottom_nav/homepage.dart';
import 'bottom_nav/my_applied.dart';
import 'bottom_nav/profile.dart';

class Bottom_Nav extends StatefulWidget {
  const Bottom_Nav({Key? key}) : super(key: key);

  @override
  State<Bottom_Nav> createState() => _Bottom_NavState();
}

class _Bottom_NavState extends State<Bottom_Nav> {
  final _page = [HomePage(), AllJobs(), AddJob(), MyApplied(), Profile()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black54,
        currentIndex: _currentIndex,
        selectedLabelStyle:
        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.work),label: "All Jobs"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.add_circled_solid),label: "Post Job"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.square_list_fill),label: "Applied Job"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),label: "Profile"),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _page[_currentIndex],
    );
  }
}

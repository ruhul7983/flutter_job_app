import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_nav/add_job.dart';
import 'bottom_nav/all_jobs.dart';
import 'bottom_nav/homepage.dart';
import 'bottom_nav/my_applied.dart';
import 'bottom_nav/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
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
          BottomNavigationBarItem(icon: CircleAvatar(radius:17, backgroundColor:Color(0xFF120160),child: Center(child: Icon(CupertinoIcons.add,size: 15,))),label: "Post Job"),
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

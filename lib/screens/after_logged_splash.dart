import 'dart:async';

import 'package:flutter/material.dart';
import 'package:job_app/screens/bottom_nav.dart';
import 'package:job_app/utils/colors.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class AfterLoginSplash extends StatefulWidget {
  const AfterLoginSplash({Key? key}) : super(key: key);

  @override
  State<AfterLoginSplash> createState() => _AfterLoginSplashState();
}

class _AfterLoginSplashState extends State<AfterLoginSplash> {
  @override
  void initState() {
    addData();
    whereTogo();
    super.initState();
  }
  addData() async {
    UserProvider _userProvider = Provider.of(context,listen: false);
    await _userProvider.refreshUser();
  }

  whereTogo() async {
      Timer(Duration(seconds: 5), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>BottomNav()));
      });
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: mainColor,
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.work,size: 30,),
            Text("Job App",style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}

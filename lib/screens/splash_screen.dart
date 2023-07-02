import 'package:flutter/material.dart';
import 'package:job_app/screens/signup_screen.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image(
                  image: AssetImage("assets/splash_screen.jpg"),
                ),
              ),
              SizedBox(height: mq.height * 0.09,),
              Text("Find Your",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
              Text("Dream Job",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.orangeAccent,decoration: TextDecoration.underline),),
              Text("Here!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: mq.height * 0.04,),
              Text("Explore the most exciting Job based on your interest and skill and study major",style: TextStyle(fontSize: 16),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUp()));
                    },
                    child: Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Color(0xff090854)
                      ),
                      child: Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 50,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

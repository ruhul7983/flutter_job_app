import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_app/screens/feature_screen/pdf_view.dart';
import 'package:job_app/screens/feature_screen/your_job_post.dart';
import 'package:job_app/screens/signup_screen.dart';
import 'package:job_app/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../model/user.dart';
import '../../provider/user_provider.dart';
import '../../widgets/profile_page_container.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}



class _ProfileState extends State<Profile> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final UserClass user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      backgroundColor: Color(0xFFebe8e8),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: mainColor,
        title: Text("Profile",style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: () async {
           await FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=>SignUp())));
          }, icon:Icon(Icons.logout)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 12,right: 12,top: 5),
          child: Column(
            children: [
              Container(
                height: mq.height * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    SizedBox(height: mq.height * 0.02,),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(user.image),
                    ),
                    SizedBox(height: mq.height * 0.02,),
                    Text(user.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: mq.height * 0.02,),
              Container(
                height: mq.height * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ProfilePageText(text: "Personal Details",icon: Icon(Icons.person)),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>PdfView()));
                        },
                        child: ProfilePageText(text: "CV",icon: Icon(Icons.picture_as_pdf))),
                  ],
                ),
              ),
              SizedBox(height: mq.height * 0.02,),
              Container(
                height: mq.height * 0.14,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>YourJobPost()));
                        },
                        child: ProfilePageText(text: "Your Job Post",icon: Icon(Icons.person))),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

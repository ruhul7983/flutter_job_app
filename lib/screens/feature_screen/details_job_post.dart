import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_app/screens/feature_screen/apply_now.dart';
import 'package:job_app/utils/colors.dart';
import 'package:job_app/widgets/auth_button.dart';

import '../../main.dart';

class DetailsJobPost extends StatefulWidget {
  final snap;
  const DetailsJobPost({Key? key,required this.snap}) : super(key: key);

  @override
  State<DetailsJobPost> createState() => _DetailsJobPostState();
}

class _DetailsJobPostState extends State<DetailsJobPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(widget.snap['jobTitle'],style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.snap['companyName'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: mq.height * 0.01,),
              Text(widget.snap['jobPosition'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color(0xFF068896)),),
              SizedBox(height: mq.height * 0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Deadline:",style: TextStyle(fontSize: 15),),

                      Text(widget.snap['deadline'],style: TextStyle(color: Color(0xFF740656),fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Salary:",style: TextStyle(fontSize: 15),),
                      Text("${widget.snap['salary']} (Monthly)",style: TextStyle(color: Color(0xFF000000),fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.black,height: 40),
              Text('No of Vacancy:',style: TextStyle(fontSize: 18,color: Color(0xFF740656),fontWeight: FontWeight.bold),),
              Text(widget.snap['vacancy'],style: TextStyle(fontSize: 17,color: Colors.black),),
              SizedBox(height: mq.height* 0.02,),
              Text('Job Location:',style: TextStyle(fontSize: 18,color: Color(0xFF740656),fontWeight: FontWeight.bold),),
              Text(widget.snap['location'],style: TextStyle(fontSize: 17,color: Colors.black),),
              SizedBox(height: mq.height* 0.02,),
              Text('Job Context:',style: TextStyle(fontSize: 18,color: Color(0xFF740656),fontWeight: FontWeight.bold),),
              Text(widget.snap['jobContext'],style: TextStyle(fontSize: 17,color: Colors.black),maxLines: 6,),
              SizedBox(height: mq.height* 0.02,),
              Text('Job Responsibilities:',style: TextStyle(fontSize: 18,color: Color(0xFF740656),fontWeight: FontWeight.bold),),
              Text(widget.snap['responsibilities'],style: TextStyle(fontSize: 17,color: Colors.black),maxLines: 8,),
              SizedBox(height: mq.height* 0.02,),
              Text('Job Nature:',style: TextStyle(fontSize: 18,color: Color(0xFF740656),fontWeight: FontWeight.bold),),
              Text(widget.snap['categories'],style: TextStyle(fontSize: 17,color: Colors.black),),
              SizedBox(height: mq.height* 0.02,),
              Text('Educational Responsibilities: ',style: TextStyle(fontSize: 18,color: Color(0xFF740656),fontWeight: FontWeight.bold),),
              Text(widget.snap['education'],style: TextStyle(fontSize: 17,color: Colors.black),),
              SizedBox(height: mq.height* 0.02,),
              Text('Additional Requirement: ',style: TextStyle(fontSize: 18,color: Color(0xFF740656),fontWeight: FontWeight.bold),),
              Text(widget.snap['additionReq'],style: TextStyle(fontSize: 17,color: Colors.black),),
              SizedBox(height: mq.height* 0.02,),
              Text('Salary and Benefits: ',style: TextStyle(fontSize: 18,color: Color(0xFF740656),fontWeight: FontWeight.bold),),
              Text("${widget.snap['salary']} (Monthly)",style: TextStyle(fontSize: 17,color: Colors.black),),
              SizedBox(height: mq.height* 0.02,),
              Text('Gender: ',style: TextStyle(fontSize: 18,color: Color(0xFF740656),fontWeight: FontWeight.bold),),
              Text(widget.snap['gender'],style: TextStyle(fontSize: 17,color: Colors.black),),
              SizedBox(height: mq.height* 0.02,),
              Text('Published Date: ',style: TextStyle(fontSize: 18,color: Color(0xFF740656),fontWeight: FontWeight.bold),),
              Text(DateFormat.yMMMd().format(widget.snap['datePublished'].toDate()),style: TextStyle(fontSize: 17,color: Colors.black),),
              SizedBox(height: mq.height* 0.02,),
              Text('Company Website: ',style: TextStyle(fontSize: 18,color: Color(0xFF740656),fontWeight: FontWeight.bold),),
              Text(widget.snap['website'],style: TextStyle(fontSize: 17,color: Colors.black)),
              widget.snap['uid']==FirebaseAuth.instance.currentUser!.uid?
                  AuthButton(text: "Your job post",color: Colors.red,)
                  :widget.snap['appliedBy'].contains(FirebaseAuth.instance.currentUser!.uid)?AuthButton(text: "Already Applied(${widget.snap['appliedBy'].length})",color: Colors.green,):InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ApplyNow(snap: widget.snap,)));
                  },
                  child: AuthButton(text: "Apply Now")),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class JobPostCard extends StatefulWidget {
  final snap;
  const JobPostCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<JobPostCard> createState() => _JobPostCardState();
}

class _JobPostCardState extends State<JobPostCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
      child: Container(
        height: mq.height * 0.23,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow:  [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage("https://images.unsplash.com/photo-1563694983011-6f4d90358083?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.snap['jobTitle'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Color(0xFF120160)),),
                            SizedBox(height: mq.height  * 0.01,),
                            Text(widget.snap['location'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey),),
                          ],
                        ),
                      ),
                    ],
                  ),
                 Row(
                   children: [
                     Icon(Icons.bookmark_border,size: 33,),
                   ],
                 ),
                ],
              ),
              SizedBox(height: mq.height * 0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(widget.snap['salary'],style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(0xFF120160)),),
                      Text("/Mo",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.grey),),
                    ],
                  ),
                  //SizedBox(width: mq.width * 0.26,),
                  Row(
                    children: [
                      Text("Experience: ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color:Color(0xFF120160)),),
                      Text(widget.snap['experience'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.grey),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: mq.height * 0.025,),
              Row(
                children: [
                  Container(
                    height: mq.height * 0.05,
                    width: mq.width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFf2f1f6),
                    ),
                    child: Center(child: Text(widget.snap['jobPosition']??'no data',style: TextStyle(color: Colors.black54),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  ),
                  SizedBox(width: mq.width * 0.02,),
                  Container(
                    height: mq.height * 0.05,
                    width: mq.width * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFf2f1f6),
                    ),
                    child: Center(child: Text(widget.snap['categories'],style: TextStyle(color: Colors.black54),)),
                  ),
                  SizedBox(width: mq.width * 0.02,),
                  widget.snap['uid']==FirebaseAuth.instance.currentUser!.uid?Container(
                    height: mq.height * 0.05,
                    width: mq.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red,
                    ),
                    child: widget.snap['isPending']=='no'?Center(child: Text("View Post",style: TextStyle(color: Colors.white),)):Center(child: Text("Pending",style: TextStyle(color: Colors.white),)),
                  ):widget.snap['appliedBy'].contains(FirebaseAuth.instance.currentUser!.uid)?Container(
                    height: mq.height * 0.05,
                    width: mq.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.greenAccent,
                    ),
                    child: Center(child: Text("Applied",style: TextStyle(color: Colors.black),)),
                  ):Container(
                    height: mq.height * 0.05,
                    width: mq.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFfce0d5),
                    ),
                    child: Center(child: Text("Apply",style: TextStyle(color: Colors.black54),)),
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

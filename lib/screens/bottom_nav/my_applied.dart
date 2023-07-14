import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_app/screens/feature_screen/details_job_post.dart';
import 'package:job_app/widgets/job_post_card.dart';

import '../../utils/colors.dart';

class MyApplied extends StatefulWidget {
  const MyApplied({Key? key}) : super(key: key);

  @override
  State<MyApplied> createState() => _MyAppliedState();
}

class _MyAppliedState extends State<MyApplied> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: Text(
          "Applied Job",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("posts")
              .where("appliedBy", arrayContains: FirebaseAuth.instance.currentUser!.uid,)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show a loading indicator while waiting for data
            }
            if (!snapshot.hasData || snapshot.connectionState != ConnectionState.active) {
              return Text('No data available'); // Handle the case when there's no data or stream is not active
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot snap = snapshot.data!.docs[index];
                return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsJobPost(snap: snap)));
                    },
                    child: JobPostCard(snap: snap));
              },
            );
          },
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_app/screens/feature_screen/details_job_post.dart';
import 'package:job_app/utils/colors.dart';

import '../../widgets/job_post_card.dart';

class YourJobPost extends StatefulWidget {
  const YourJobPost({Key? key}) : super(key: key);

  @override
  State<YourJobPost> createState() => _YourJobPostState();
}

class _YourJobPostState extends State<YourJobPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: Text(
          "Posted by You",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFf5f6f8),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').where('uid',isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
          builder: (context, snapshot) {
            final List<DocumentSnapshot>? documents = snapshot.data?.docs;
            final int itemCount = documents?.length ?? 0;
            final int displayedItemCount = itemCount <= 100 ? itemCount : 100;
            return ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              clipBehavior: Clip.antiAlias,
              itemCount: displayedItemCount,
              itemBuilder: (context, index) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsJobPost(snap: snapshot.data!.docs[index] as dynamic,)));
                    },
                    child: JobPostCard(snap: snapshot.data!.docs[index] as dynamic,));
              },);

          },
        ),
      ),
    );
  }
}

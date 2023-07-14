import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_app/utils/colors.dart';
import 'package:job_app/widgets/job_post_card.dart';

import '../../feature_screen/details_job_post.dart';

class PartTime extends StatefulWidget {
  const PartTime({Key? key}) : super(key: key);

  @override
  State<PartTime> createState() => _PartTimeState();
}

class _PartTimeState extends State<PartTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f6f8),
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        elevation: 0,
        title: Text("Part time job",style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').where('isPending',isEqualTo: 'no').where('categories',isEqualTo: 'Part Time').snapshots(),
          builder: (context, snapshot) {
            final List<DocumentSnapshot>? documents = snapshot.data?.docs;
            final int itemCount = documents?.length ?? 0;
            final int displayedItemCount = itemCount <= 100 ? itemCount : 100;
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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

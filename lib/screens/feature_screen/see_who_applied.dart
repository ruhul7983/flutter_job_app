import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_app/screens/feature_screen/applied_user_data.dart';
import 'package:job_app/widgets/user_view_listtile.dart';

import '../../utils/colors.dart';

class SeeWhoApplied extends StatefulWidget {
  final snap;
  const SeeWhoApplied({Key? key, required this.snap}) : super(key: key);

  @override
  State<SeeWhoApplied> createState() => _SeeWhoAppliedState();
}

class _SeeWhoAppliedState extends State<SeeWhoApplied> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text("Apply Your Post",style: TextStyle(color: Colors.black),),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').doc(widget.snap['postId']??'').collection('applied').snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            clipBehavior: Clip.antiAlias,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              if(snapshot.hasData){
                return Center(
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>AppliedUserData(snap: snapshot.data!.docs[index])));
                      },
                      child: UserViewListTile(snap: snapshot.data!.docs[index])));
              }
              if(snapshot.hasError){
                return Center(
                  child: Text("No one applied yet"),
                );
              }

              return CircularProgressIndicator();
            },);

        },
      ),
    );
  }
}

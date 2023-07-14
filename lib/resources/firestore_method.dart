import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_app/resources/stroage_method.dart';
import 'package:uuid/uuid.dart';
class FireStoreMethod{
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String>completeProfile(String name,String dob,String location, String contactNumber, Uint8List image, List<String> expertise)async{
    String photoUrl = await StorageMethods().uploadImage('profilePic', image, true);
    String res = 'Something went wrong';
    try{
      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
        'name' : name,
        'dob' : dob,
        'location': location,
        'phone': contactNumber,
        'image': photoUrl,
        'expertise': 'test',
        'joined':DateTime.now(),
      });
      res = 'success';
    }catch(err){
      print(err.toString());
    }

    return res;
  }
  //set job post
  Future<String> setJobPost(
      String jobPosition,
      String jobContext,
      String responsibilities,
      String companyName,
      String location,
      String experience,
      String categories,
      String gender,
      String education,
      String age,
      String additionReq,
      String salary,
      String vacancy,
      String jobTitle,
      String deadline,
      String website,
      Uint8List image) async {
    String res = 'Something went wrong';
    String photoUrl = await StorageMethods().uploadImage("companyLogo", image, false);
    String postId = Uuid().v1();
    try{
      _firestore.collection("posts").doc(postId).set({
        'jobPosition':jobPosition,
        'jobTitle':jobTitle,
        'jobContext':jobContext,
        'responsibilities':responsibilities,
        'companyName':companyName,
        'location':location,
        'experience':experience,
        'categories':categories,
        'gender':gender,
        'education':education,
        'age':age,
        'additionReq':additionReq,
        'salary':salary,
        'vacancy':vacancy,
        'deadline':deadline,
        'website':website,
        'companyLogo':photoUrl,
        'isPending':'yes',
        'appliedBy':[],
        'postId':postId,
        'uid':_auth.currentUser!.uid,
        'datePublished':DateTime.now(),
      });
      res = 'success';
    }catch(err){

    }

    return res;
  }

  //try to get length of post remote
  Future<String> getRemoteLen() async {
    String res = "0";
    String countRemote = "0";

    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection("posts")
          .where('categories', isEqualTo: 'Remote')
          .get();

      countRemote = querySnapshot.size.toString();
      res = countRemote;
    } catch (err) {
      // Handle any errors
    }

    return res;
  }
  //try to get length of post remote
  Future<String> getFullLen() async {
    String res = "0";
    String countRemote = "0";

    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection("posts")
          .where('categories', isEqualTo: 'Full Time')
          .get();

      countRemote = querySnapshot.size.toString();
      res = countRemote;
    } catch (err) {
      // Handle any errors
    }

    return res;
  }
  //try to get length of post remote
  Future<String> getPartLen() async {
    String res = "0";
    String countRemote = "0";

    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection("posts")
          .where('categories', isEqualTo: 'Part Time')
          .get();

      countRemote = querySnapshot.size.toString();
      res = countRemote;
    } catch (err) {
      // Handle any errors
    }

    return res;
  }


  //apply now method
  Future<String> applyNow(
      String postId,
      String location,
      String name,
      String image,
      String cv,
      String phone,
      String email,) async {
    String res = "Something went wrong";
    String nPostId =Uuid().v1();
    try{
      await _firestore.collection("posts").doc(postId).collection("applied").doc(nPostId).set({
        "postId":nPostId,
        "name":name,
        "email":email,
        "image":image,
        "cv":cv,
        "location":location,
        "phone":phone,
        "applyDate":DateTime.now(),
      });
      await _firestore.collection("posts").doc(postId).update({
        'appliedBy':FieldValue.arrayUnion([_auth.currentUser!.uid]),
      });
      res = 'success';

    }catch(err){
      print(err.toString());
    }

    return res;
  }

}
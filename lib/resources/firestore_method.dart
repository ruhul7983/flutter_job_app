import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_app/resources/stroage_method.dart';
class FireStoreMethod{
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String>completeProfile(String name,String dob,String location, String contactNumber, Uint8List image, List<String> expertise)async{
    String photoUrl = await StorageMethods().uploadImage('profilePic', image, false);
    String res = 'Something went worng';
    try{
      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
        'name' : name,
        'dob' : dob,
        'location': location,
        'phone': contactNumber,
        'image': photoUrl,
        'expertise': expertise,
        'joined':DateTime.now(),
      });
      res = 'success';
    }catch(err){
      print(err.toString());
    }

    return res;
  }
}
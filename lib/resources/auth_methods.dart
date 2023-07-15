import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_app/model/user.dart';
import 'package:job_app/resources/stroage_method.dart';


class AuthMethod{
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //getuser details
  Future<UserClass> getUserDetails() async{
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap = await _firestore.collection("users").doc(currentUser.uid).get();
    return UserClass.fromSnap(snap);

  }
  //signup
  Future<String> SingUp(
      String email,
      String password,
      String name,
      String dob,
      String location,
      String contactNumber,
      Uint8List image,
      Uint8List cv,
      List<String> expertise,
      ) async {
    String res = "Something went wrong";
    UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password,);
    String photoUrl = await StorageMethods().uploadImage('profilePic', image, false);
    String cvUrl = await StorageMethods().uploadCV('cv', cv);

    try{
      if(image!=null || cv!=null){

        await _firestore.collection('users').doc(cred.user!.uid).set({
          "email":email,
          "uid":cred.user!.uid,
          'name' : name,
          'dob' : dob,
          'location': location,
          'phone': contactNumber,
          'image': photoUrl,
          'expertise': expertise,
          'cv': cvUrl,
          'joined':DateTime.now(),
        });
        return res;
      }
    }catch(err){
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Something went wrong";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
      }else{
        return res = "Please enter all filed";
      }
    }catch(err){
      res = err.toString();
    }
    return res;
  }
}
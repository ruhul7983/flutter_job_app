import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod{
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> SingUp(String email,String password)async{
    String res = "Something went wrong";
    try{
      UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

     await _firestore.collection('users').doc(cred.user!.uid).set({
       "email":email,
       "uid":cred.user!.uid,
     });

    }catch(err){
      res = err.toString();
    }
    return res;
  }
}
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods{
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImage(String childName, Uint8List file, bool isPost) async {

    Reference ref = await _storage.ref().child(childName).child(_auth.currentUser!.uid);
    if(isPost){
      String id = Uuid().v1();
      ref = ref.child(id);
    }

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap =  await uploadTask;

    String downloadUrl =await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadCV(String childName, Uint8List file,)async{
    Reference ref = await _storage.ref().child(childName).child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap =await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';
class UserClass{
  final String email;
  final String uid;
  final String phone;
  final String image;
  final String cv;
  late final String name;
  final List expertise;
  final dob;
  final joined;
  final location;

  UserClass({
    required this.email,
    required this.uid,
    required this.phone,
    required this.name,
    required this.image,
    required this.expertise,
    required this.cv,
    required this.dob,
    required this.joined,
    required this.location,
  });
  Map<String,dynamic> toJson()=>{
    "name":name,
    "uid":uid,
    "email":email,
    "phone":phone,
    "image":image,
    "expertise":expertise,
    "cv":cv,
    "joined":joined,
    "dob":dob,
    "location":location,

  };

  static UserClass fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserClass(
      email: snapshot['email'] ?? '',
      uid: snapshot['uid']??'',
      phone: snapshot['phone']??'',
      name: snapshot['name']??'',
      image: snapshot['image']??'',
      expertise: snapshot['expertise']??'',
      cv: snapshot['cv']??'',
      location: snapshot['location']??'',
      joined: snapshot['joined']??'',
      dob: snapshot['dob']??'',

    );
  }

}
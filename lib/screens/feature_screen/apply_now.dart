import 'package:flutter/material.dart';
import 'package:job_app/resources/firestore_method.dart';
import 'package:job_app/utils/colors.dart';
import 'package:job_app/widgets/apply_now_text.dart';
import 'package:job_app/widgets/auth_button.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
import '../../provider/user_provider.dart';

class ApplyNow extends StatefulWidget {
  final snap;
  const ApplyNow({Key? key,  required this.snap}) : super(key: key);

  @override
  State<ApplyNow> createState() => _ApplyNowState();
}

class _ApplyNowState extends State<ApplyNow> {

  @override
  Widget build(BuildContext context) {
    final UserClass user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text("Apply Now",style: TextStyle(color: Colors.black),),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10,right: 10,top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ApplyNowText(text: 'Apply with this property', frontSize: 20, frontWeight: FontWeight.bold),
              Divider(height: 10,color: Colors.black,),
              ApplyNowText(text: 'Image: ', frontSize: 20, frontWeight: FontWeight.bold),
              Container(
                height: 200,
                width: 200,
                child: Image(
                  image: NetworkImage(user.image),
                ),
              ),
              ApplyNowText(text: 'Name: ', frontSize: 20, frontWeight: FontWeight.bold),
              ApplyNowText(text: user.name, frontSize: 18, frontWeight: FontWeight.normal),
              ApplyNowText(text: 'Email: ', frontSize: 20, frontWeight: FontWeight.bold),
              ApplyNowText(text: user.email, frontSize: 18, frontWeight: FontWeight.normal),
              ApplyNowText(text: 'Phone: ', frontSize: 20, frontWeight: FontWeight.bold),
              ApplyNowText(text: user.phone, frontSize: 18, frontWeight: FontWeight.normal),
              ApplyNowText(text: 'Date of Birth: ', frontSize: 20, frontWeight: FontWeight.bold),
              ApplyNowText(text: user.dob, frontSize: 18, frontWeight: FontWeight.normal),
              ApplyNowText(text: 'Address: ', frontSize: 20, frontWeight: FontWeight.bold),
              ApplyNowText(text: user.location, frontSize: 18, frontWeight: FontWeight.normal),
              ApplyNowText(text: 'CV:', frontSize: 20, frontWeight: FontWeight.bold),
              ApplyNowText(text: 'CV will automatically submitted from your profile', frontSize: 18, frontWeight: FontWeight.bold,color: Colors.red,),
              //ApplyNowText(text: user.cv, frontSize: 18, frontWeight: FontWeight.normal),
              InkWell(
                  onTap: () async {
                    await FireStoreMethod().applyNow(widget.snap['postId'], user.location, user.name, user.image, user.cv, user.phone, user.email,);
                  },
                  child: AuthButton(text: "Apply")),
            ],
          ),
        ),
      ),
    );
  }
}

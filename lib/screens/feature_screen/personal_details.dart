import 'package:flutter/material.dart';
import 'package:job_app/utils/colors.dart';
import 'package:job_app/widgets/apply_now_text.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
import '../../provider/user_provider.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {

  @override
  Widget build(BuildContext context) {
    final UserClass user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text("Personal Details",style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10,top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            ],
          ),
        ),
      ),
    );
  }
}

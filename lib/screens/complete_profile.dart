import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_app/screens/select_expertise_screen.dart';
import 'package:job_app/widgets/auth_button.dart';
import 'package:job_app/widgets/text_field.dart';

import '../main.dart';
import '../utils/utils.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}
final TextEditingController nameController = TextEditingController();
final TextEditingController dovController = TextEditingController();
final TextEditingController locationController = TextEditingController();
final TextEditingController contactController = TextEditingController();

Uint8List? _image;


class _CompleteProfileState extends State<CompleteProfile> {
  Future<void> selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text("Complete\nyour profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                        ),
                      ],
                    ),
                    Container(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topRight,
                      child: Image(
                        height: mq.height * 0.2,
                        image: AssetImage('assets/background_auth.png'),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                        : CircleAvatar(
                      radius: 64,
                      child: Icon(Icons.person,size: 100,),
                      backgroundColor: Colors.black,
                    ),
                    Positioned(
                        bottom: -10,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            selectImage();
                          },
                          icon: Icon(
                            Icons.add_photo_alternate,
                            color: Colors.lightGreenAccent,
                          ),
                        ))
                  ],
                ),

                TextInputField(textEditingController: nameController, hintText: "Enter your full name", textInputType: TextInputType.text),
                TextInputField(textEditingController: dovController, hintText: "Date of Birth", textInputType: TextInputType.text),
                TextInputField(textEditingController: locationController, hintText: "Location", textInputType: TextInputType.text),
                TextInputField(textEditingController: contactController, hintText: "Contact Number", textInputType: TextInputType.phone),
                SizedBox(height: mq.height * 0.01,),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>SelectExpertise()));
                    },
                    child: AuthButton(text: 'Next')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

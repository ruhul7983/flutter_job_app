import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:job_app/screens/select_expertise_screen.dart';
import 'package:job_app/widgets/auth_button.dart';
import 'package:job_app/widgets/text_field.dart';

import '../main.dart';
import '../utils/utils.dart';

class CompleteProfile extends StatefulWidget {
  final String email;
  final String password;
  const CompleteProfile({Key? key, required this.email, required this.password}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}
final TextEditingController nameController = TextEditingController();
final TextEditingController dobController = TextEditingController();
final TextEditingController locationController = TextEditingController();
final TextEditingController contactController = TextEditingController();

Uint8List? _image;
Uint8List? _file;
DateTime? _selectedDate;
class _CompleteProfileState extends State<CompleteProfile> {
  Future<void> selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  Future<void> selectCV()async{
    Uint8List? cv = await pickFile();
    setState(() {
      _file = cv;
    });
  }

   Future<DateTime?> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(2005),
        firstDate: DateTime(1970),
        lastDate: DateTime(2015));
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        dobController.text = formatter.format(_selectedDate!);
      });
    }
    return pickedDate;
  }
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  void validate(){
    if(formKey.currentState!.validate()){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => SelectExpertise(
                  name: nameController.text,
                  dob: dobController.text,
                  location: locationController.text,
                  number: contactController.text,
                  image: _image!,
                  email: widget.email,
                  password: widget.password, cv: _file!,)));

    }
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
            child: Form(
              key: formKey,
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
                  //TextInputField(textEditingController: dobController, hintText: "Date of Birth", textInputType: TextInputType.text),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 12),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Date of Birth',
                      ),
                      onTap: (){
                        selectDate();
                      },
                      controller: dobController,
                    ),
                  ),
                  TextInputField(textEditingController: locationController, hintText: "Location", textInputType: TextInputType.text),
                  TextInputField(textEditingController: contactController, hintText: "Contact Number", textInputType: TextInputType.phone),
                  SizedBox(height: mq.height * 0.01,),
                  InkWell(
                    onTap: (){
                      selectCV();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        height: mq.height * 0.07,
                        width: double.infinity,
                        child: _file!=null?Center(child: Text("Selected file",style: TextStyle(fontSize: 20),)):Row(
                          children: [
                            Icon(Icons.file_copy),
                            SizedBox(width: 10,),
                            Text("Choose file"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: (){
                        validate();
                        /*Navigator.push(context, MaterialPageRoute(builder: (_) =>
                            SelectExpertise(name: nameController.text,
                              dob: dobController.text,
                              location: locationController.text,
                              number: contactController.text,
                              image: _image!,)));*/
                      },
                      child: AuthButton(text: 'Next')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

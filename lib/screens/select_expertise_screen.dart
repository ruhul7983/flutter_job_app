import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:job_app/resources/auth_methods.dart';
import 'package:job_app/screens/bottom_nav.dart';
import 'package:job_app/utils/colors.dart';
import 'package:job_app/widgets/auth_button.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../provider/user_provider.dart';

class SelectExpertise extends StatefulWidget {
  final String name;
  final String email;
  final String password;
  final String dob;
  final String location;
  final String number;
  final Uint8List image;
  final Uint8List cv;
  const SelectExpertise({Key? key, required this.name, required this.dob, required this.location, required this.number, required this.image, required this.email, required this.password, required this.cv}) : super(key: key);

  @override
  State<SelectExpertise> createState() => _SelectExpertiseState();
}

class _SelectExpertiseState extends State<SelectExpertise> {
  List<String> selectedValues = [];

  List<String> checkboxItems = [
    'Android Developer',
    'Web Developer',
    'Backend Developer',
    'Graphics Designer',
    'UI/UX Designer',
    'Digital Marketing',
  ];

  void onCheckboxChanged(bool value, String item) {
    setState(() {
      if (value) {
        selectedValues.add(item);
      } else {
        selectedValues.remove(item);
      }
    });
  }
  @override
  void initState() {
    addData();
    super.initState();
  }
  addData() async {
    UserProvider _userProvider = Provider.of(context,listen: false);
    await _userProvider.refreshUser();
  }
  Future<void> singUP() async {
     String res =await AuthMethod()
        .SingUp(
        widget.email,
        widget.password,
        widget.name,
        widget.dob,
        widget.location,
        widget.number,
        widget.image,
        widget.cv,
        selectedValues.toList());
    if(res == 'success'){
      await addData();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>BottomNav()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('What is your Expertise?',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text("Please select the field of expertise (up to 3)"),
            Expanded(
              child: ListView.builder(
                itemCount: checkboxItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final String item = checkboxItems[index];

                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CheckboxListTile(
                        title: Text(item,style: TextStyle(fontSize: 17),),
                        value: selectedValues.contains(item),
                        onChanged: (bool ?value) {
                          onCheckboxChanged(value!, item);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: mq.height * 0.02,),

            InkWell(
                onTap: (){
                  singUP();
                  //FireStoreMethod().completeProfile(widget.name, widget.dob, widget.location, widget.number, widget.image, selectedValues.toList());
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>BottomNav()));

                },
                child: AuthButton(text: "Submit")),

          ],
        ),
      ),
    );
  }
}

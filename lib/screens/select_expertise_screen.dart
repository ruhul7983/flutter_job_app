import 'package:flutter/material.dart';
import 'package:job_app/screens/signup_screen.dart';
import 'package:job_app/utils/colors.dart';
import 'package:job_app/widgets/auth_button.dart';

import '../main.dart';

class SelectExpertise extends StatefulWidget {
  const SelectExpertise({Key? key}) : super(key: key);

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
                  print(emailController);
                },
                child: AuthButton(text: "Submit")),

          ],
        ),
      ),
    );
  }
}

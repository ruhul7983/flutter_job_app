import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:job_app/resources/firestore_method.dart';
import 'package:job_app/utils/colors.dart';
import 'package:job_app/widgets/auth_button.dart';
import 'package:job_app/widgets/post_job_textField.dart';
import '../../main.dart';
import '../../utils/utils.dart';

class AddJob extends StatefulWidget {

  const AddJob({Key? key}) : super(key: key);

  @override
  State<AddJob> createState() => _AddJobState();
}

final TextEditingController jobPositionController = TextEditingController();
final TextEditingController jobTitleController = TextEditingController();
final TextEditingController jobContextController = TextEditingController();
final TextEditingController deadlineController = TextEditingController();
final TextEditingController jobResponsibilitiesController = TextEditingController();
final TextEditingController companyNameController = TextEditingController();
final TextEditingController jobLocationController = TextEditingController();
final TextEditingController educationController = TextEditingController();
final TextEditingController ageController = TextEditingController();
final TextEditingController additionRequirementController = TextEditingController();
final TextEditingController salaryController = TextEditingController();
final TextEditingController vacancyController = TextEditingController();
final TextEditingController websiteController = TextEditingController();
Uint8List? _image;
DateTime? _selectedDate;
class _AddJobState extends State<AddJob> {
  Future<void> selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  //for select deadline date
  Future<DateTime?> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2025));
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        deadlineController.text = formatter.format(_selectedDate!);
      });
    }
    return pickedDate;

  }

  var selectedExperience = 'Freshers';
  var selectedCategories = 'Full Time';
  var selectedGender = 'Male';
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  void validate(){
    if(formKey.currentState!.validate()){
      postSubmit();
    }
  }

  Future<String> postSubmit()async{
    String res = await FireStoreMethod().setJobPost(
      jobPositionController.text,
      jobContextController.text,
      jobResponsibilitiesController.text,
      companyNameController.text,
      jobLocationController.text,
      selectedExperience,
      selectedCategories,
      selectedGender,
      educationController.text,
      ageController.text,
      additionRequirementController.text,
      salaryController.text,
      vacancyController.text,
      jobTitleController.text,
      deadlineController.text,
      websiteController.text,
      _image!,
    );
    return res;
  }




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text("Post a Job",style: TextStyle(color: Colors.black)),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12,right: 12,top: 8),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                    Text("Get the best employee",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: mq.height * 0.02,),
                  Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                          : CircleAvatar(
                        radius: 64,
                        child: Image.asset("assets/google.png",height: 150,width: 150,),
                        backgroundColor: Colors.white70,
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
                  Text("Select your company logo",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),),
                  SizedBox(height: mq.height*0.02,),
                  JobPostTextField(hintText: "Android Developer", label: "Job Title", maxLine: 1, controller: jobTitleController),
                  JobPostTextField(hintText: "Senior Developer", label: "Job Position", maxLine: 1, controller: jobPositionController),
                  JobPostTextField(onTAP: selectDate,hintText: "Deadline", label: "Deadline", maxLine: 1, controller: deadlineController),
                    JobPostTextField(hintText: "Job Context", label: "Job Context", maxLine: 4, controller: jobContextController),
                    JobPostTextField(hintText: "Job Responsibilities", label: "Job Responsibilities", maxLine: 7, controller: jobResponsibilitiesController),
                    JobPostTextField(hintText: "Google Inc", label: "Company Name", maxLine: 1, controller: companyNameController),
                    JobPostTextField(hintText: "Dhaka", label: "Company Location", maxLine: 1, controller: jobLocationController),
                  Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 10),
                          child: Text("Experience: ",style: TextStyle(fontSize: 18),),
                        ),
                        DropdownButton(
                            value: selectedExperience,
                            items: [
                              DropdownMenuItem(
                                  value: "Freshers", child: Text("Freshers")),
                              DropdownMenuItem(
                                  value: "1 year",
                                  child: Text("1 year Experience")),
                              DropdownMenuItem(
                                  value: "2 years",
                                  child: Text("2 years Experience")),
                              DropdownMenuItem(
                                  value: "3-4 years",
                                  child: Text("3-4 years Experience")),
                              DropdownMenuItem(
                                  value: "5+ years",
                                  child: Text("5+ years Experience")),
                            ],
                            onChanged: (val) {
                              setState(() {
                                selectedExperience = val!;
                              });
                            }),
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 10),
                          child: Text("Categories: ",style: TextStyle(fontSize: 18),),
                        ),
                        DropdownButton(
                            value: selectedCategories,
                            items: [
                              DropdownMenuItem(
                                  value: "Remote", child: Text("Remote")),
                              DropdownMenuItem(
                                  value: "Full Time", child: Text("Full Time")),
                              DropdownMenuItem(
                                  value: "Part Time", child: Text("Part Time")),
                            ],
                            onChanged: (val) {
                              setState(() {
                                selectedCategories = val!;
                              });
                            }),
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 10),
                          child: Text("Gender: ",style: TextStyle(fontSize: 18),),
                        ),
                        DropdownButton(
                            value: selectedGender,
                            items: [
                              DropdownMenuItem(
                                  value: "Male", child: Text("Male")),
                              DropdownMenuItem(
                                  value: "Female", child: Text("Female")),
                              DropdownMenuItem(
                                  value: "Male/Female Both", child: Text("Male/Female Both")),
                            ],
                            onChanged: (val) {
                              setState(() {
                                selectedGender = val!;
                              });
                            }),
                      ],
                    ),
                  ),
                  JobPostTextField(hintText: "BSc in Computer Science and Engineering", label: "Education", maxLine: 2, controller: educationController),
                  JobPostTextField(hintText: "18-22 years", label: "Age", maxLine: 1, controller: ageController),
                  JobPostTextField(hintText: "Any additional requirement?", label: "Additional requirement", maxLine: 5, controller: additionRequirementController),
                  JobPostTextField(hintText: "50k BDT only", label: "Salary", maxLine: 1, controller: salaryController),
                  JobPostTextField(hintText: "No of Vacancy", label: "Vacancy", maxLine: 1, controller: vacancyController),
                  JobPostTextField(hintText: "www.google.com", label: "Company Website", maxLine: 1, controller: websiteController),
                  SizedBox(height: mq.height * 0.02,),
                  InkWell(
                      onTap: (){
                        validate();
                        jobPositionController.text = '';
                        jobTitleController.text = '';
                        jobContextController.text = '';
                        jobResponsibilitiesController.text = '';
                        companyNameController.text = '';
                        jobLocationController.text = '';
                        educationController.text = '';
                        ageController.text = '';
                        additionRequirementController.text = '';
                        salaryController.text = '';
                        vacancyController.text = '';
                        deadlineController.text = '';
                        websiteController.text = '';

                        },
                      child: AuthButton(text: "Submit")),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

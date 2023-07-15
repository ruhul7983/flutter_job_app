import 'package:flutter/material.dart';
import 'package:job_app/screens/feature_screen/CV_View.dart';
import 'package:job_app/utils/colors.dart';
import 'package:job_app/widgets/auth_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import '../../widgets/apply_now_text.dart';

class AppliedUserData extends StatefulWidget {
  final snap;

  const AppliedUserData({Key? key, required this.snap}) : super(key: key);

  @override
  State<AppliedUserData> createState() => _AppliedUserDataState();
}

class _AppliedUserDataState extends State<AppliedUserData> {

  //opening email
  void openEmail() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: widget.snap['email'] ?? '', // Add a null check here
      query: encodeQueryParameters(<String, String>{
        'subject': 'Add your subject',
        'body': 'Message to ${widget.snap['name'] ?? ''}', // Add a null check here
      }),
    );

    launchUrl(emailLaunchUri);
  }
  //call to candidate
  Future<void> callLaunch() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: widget.snap['phone'] ?? '', // Add a null check here
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: Text(
          widget.snap['name'] ?? '', // Add a null check here
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image(
                  image: NetworkImage(widget.snap['image'] ?? ''), // Add a null check here
                ),
              ),
              ApplyNowText(text: 'Name: ', frontSize: 20, frontWeight: FontWeight.bold),
              ApplyNowText(text: widget.snap['name'] ?? '', frontSize: 18, frontWeight: FontWeight.normal),
              ApplyNowText(text: 'Email: ', frontSize: 20, frontWeight: FontWeight.bold),
              ApplyNowText(text: widget.snap['email'] ?? '', frontSize: 18, frontWeight: FontWeight.normal),
              ApplyNowText(text: 'Phone: ', frontSize: 20, frontWeight: FontWeight.bold),
              ApplyNowText(text: widget.snap['phone'] ?? '', frontSize: 18, frontWeight: FontWeight.normal),
              ApplyNowText(text: 'Address: ', frontSize: 20, frontWeight: FontWeight.bold),
              ApplyNowText(text: widget.snap['location'] ?? '', frontSize: 18, frontWeight: FontWeight.normal),
              InkWell(
                onTap: () {
                  if (widget.snap['cv'] != null) { // null check here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CvView(cvUrl: widget.snap['cv'])),
                    );
                  }
                },
                child: Container(
                  height: mq.height * 0.07,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(Icons.file_copy, size: 20),
                      SizedBox(width: mq.width * 0.01),
                      Text("View CV", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: mq.height * 0.02),
              InkWell(
                onTap: () {
                  callLaunch();
                },
                child: AuthButton(text: 'Call', color: Colors.green),
              ),
              InkWell(
                onTap: () {
                  openEmail();
                },
                child: AuthButton(text: 'Email', color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

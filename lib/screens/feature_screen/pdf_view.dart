import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_app/utils/colors.dart';

class PdfView extends StatelessWidget {
  const PdfView({Key? key,}) : super(key: key);



  Future<PDFDocument> getCV() async {
    String cvUrl = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((doc) => doc['cv'] as String);

    if (cvUrl.isNotEmpty) {
      PDFDocument document = await PDFDocument.fromURL(cvUrl);
      return document;
    } else {
      throw Exception('CV URL is empty or not found.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text("CV",style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10,right: 10,top: 5),
        child: FutureBuilder<PDFDocument>(
          future: getCV(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return PDFViewer(
                  document: snapshot.data!,
                );
              } else {
                return Center(
                  child: Text('CV not found.'),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

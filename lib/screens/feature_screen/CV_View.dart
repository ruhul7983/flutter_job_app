import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class CvView extends StatefulWidget {
  final String cvUrl;

  const CvView({Key? key, required this.cvUrl}) : super(key: key);

  @override
  State<CvView> createState() => _CvViewState();
}

class _CvViewState extends State<CvView> {
  late Future<PDFDocument> _cvDocument;

  @override
  void initState() {
    super.initState();
    _cvDocument = cvUrl();
  }

  Future<PDFDocument> cvUrl() async {
    PDFDocument document = await PDFDocument.fromURL(widget.cvUrl);
    return document;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "CV",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<PDFDocument>(
        future: _cvDocument,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PDFViewer(
              document: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to load PDF'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

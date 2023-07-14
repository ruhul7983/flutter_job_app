import 'package:flutter/material.dart';

class JobPostTextField extends StatelessWidget {
  final String hintText;
  final String? name;
  final String label;
  final int maxLine;
  final int? maxLength;
  final TextEditingController controller;
  final VoidCallback? onTAP;
  final Function(String?)? onSaved;

  const JobPostTextField(
      {Key? key,
      required this.hintText,
      required this.label,
      required this.maxLine,
        this.maxLength, required this.controller, this.onTAP, this.name, this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
      child: TextFormField(
        onSaved: onSaved,
        validator: (val){
          if(val!.isEmpty){
            return "Required";
          }
          return null;
        },
        onTap: onTAP,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12),),
            borderSide: BorderSide(width: 2,color: Colors.black),
            gapPadding: 2,
          ),
          label: Text(label),
        ),
        maxLines: maxLine,
        maxLength: maxLength,
      ),
    );
  }
}

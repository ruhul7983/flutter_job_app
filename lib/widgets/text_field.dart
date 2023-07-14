import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;

  const TextInputField(
      {Key? key,
        required this.textEditingController, this.isPass = false,
        required this.hintText,
        required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 12),
      child: TextFormField(
        validator: (val){
          if(val!.isEmpty ){
            return "Required";
          }else if(isPass == true){
            if(val.length < 6){
              return 'Minimum 6 Character';
            }
          }
          return null;
        },

        controller: textEditingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: hintText,
        ),
        obscureText: isPass,

      ),
    );
  }
}

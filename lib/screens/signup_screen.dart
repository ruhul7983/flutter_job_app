import 'package:flutter/material.dart';
import 'package:job_app/screens/login_screen.dart';
import 'package:job_app/widgets/auth_button.dart';
import 'package:job_app/widgets/text_field.dart';

import '../main.dart';
import 'complete_profile.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  void validate(){
    if(formKey.currentState!.validate()){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>CompleteProfile(email: emailController.text,password: passwordController.text,)));
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text("Lets find\nyour dream job",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                          ),
                        ],
                      ),
                      Container(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topRight,
                        child: Image(
                          height: mq.height * 0.3,
                          //width: mq.width * 0.6,
                          image: AssetImage('assets/background_auth.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: mq.height * 0.01,),
                  TextInputField(textEditingController: emailController, hintText: "Enter valid email", textInputType: TextInputType.emailAddress),
                  TextInputField(textEditingController: passwordController, hintText: "Password", textInputType: TextInputType.text,isPass: true,),
                  InkWell(
                      onTap: (){
                        //AuthMethod().SingUp(emailController.text, passwordController.text);
                        validate();
                        //Navigator.push(context, MaterialPageRoute(builder: (_)=>CompleteProfile()));
                      },
                      child: AuthButton(text: "Next")),
                  SizedBox(height: mq.height* 0.04,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child: Divider(thickness: 1,height: 8,),
                  ),
                  Text("Or",style: TextStyle(fontSize: 15),),
                  SizedBox(height: mq.height * 0.02,),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>Login()));
                      },
                      child: Text("Have a account? Login",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

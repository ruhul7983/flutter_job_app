import 'package:flutter/material.dart';
import 'package:job_app/resources/auth_methods.dart';
import 'package:job_app/screens/bottom_nav.dart';
import 'package:job_app/screens/signup_screen.dart';
import 'package:job_app/widgets/auth_button.dart';
import 'package:job_app/widgets/text_field.dart';

import '../main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  Future<void> validate() async {
    if(formKey.currentState!.validate()){
      //Navigator.push(context, MaterialPageRoute(builder: (_)=>CompleteProfile(email: emailController.text,password: passwordController.text,)));
        String res = await AuthMethod().loginUser(email: emailController.text, password: passwordController.text);
        if(res == 'success'){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>BottomNav()));
        }
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
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
                      child: AuthButton(text: "Login")),
                  SizedBox(height: mq.height* 0.04,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child: Divider(thickness: 1,height: 8,),
                  ),
                  Text("Or",style: TextStyle(fontSize: 15),),
                  SizedBox(height: mq.height * 0.02,),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUp()));
                      },
                      child: Text("Don't have account? Sign up",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

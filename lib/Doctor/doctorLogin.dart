import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_pro/Doctor/doctorSignUp.dart';
import 'package:lottie/lottie.dart';

import '../Variable.dart';
import '../choose/choose.dart';
import '../components/components.dart';
import '../verification/verification.dart';
class doctorLogin extends StatefulWidget {
  const doctorLogin({super.key});

  @override
  State<doctorLogin> createState() => _doctorLoginState();
}
class _doctorLoginState extends State<doctorLogin> {
  var  formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Form(
        key: formkey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: 500,
              height: 800, // Adjust the height as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 220.0),
                        child: IconButton(color: Colors.black,onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>choose()));}, icon: Icon(Icons.arrow_back),),
                      ),

                      Lottie.asset('assets/parkinson.json', width: 200, height: 150),
                      SizedBox(height: 20),
                      Center(
                        child: const Text(
                          "Login \nAs A Doctor 👨‍⚕️",
                          style: TextStyle(
                            color: Color(0xFFE65100),
                            fontSize: 20,
                            letterSpacing: 6,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Tilt Neon',
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      defaultFormField(
                        controller: DUserName,
                        type: TextInputType.emailAddress,
                        hint: "User Name",
                        lable: 'User Name',
                        prefx: Icons.person,
                        validate: "Please enter your user name",
                        onSubmite: (val) {
                          print(val);
                        },
                      ),
                      const SizedBox(height: 20),
                      defaultFormField(
                        controller: Dpassword,
                        type: TextInputType.visiblePassword,
                        hint: "Password",
                        lable: 'Password',
                        prefx: Icons.lock,
                        isPassword: isPass,
                        validate: "Please enter your password",
                        onSubmite: (val) {
                          print(val);
                        },
                        suffix: IconButton(
                          icon: Icon(isPass ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isPass = !isPass;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      EleButton(s: 'Register',f:(){
              if(formkey.currentState!.validate()){

              print(code.text);
              Navigator.pop(context);}



              }),
                      QROE(t: "Don't have an account ?", w: const doctorSignUp(), t1: "Sign up", context: context),
                      TextButton(
                        onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context)=>const Verification()),
                          );
                        },
                        child: Text("forget password",style: TextStyle(color: Colors.blue[900]),),
                        //style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.9))
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


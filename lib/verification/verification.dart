import 'package:flutter/material.dart';
import 'package:grad_pro/NormalUser/NormalUserLogin.dart';
import 'package:grad_pro/choose/choose.dart';
import 'package:grad_pro/components/components.dart';
import 'package:lottie/lottie.dart';
import '../Variable.dart';
class Verification extends StatefulWidget{
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}
class _VerificationState extends State<Verification> {
  var  formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formkey,
          child: SafeArea(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 220.0),
                        child: IconButton(color: Colors.black,onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>choose()));}, icon: Icon(Icons.arrow_back),),
                      ),
                     SizedBox(height: 100,),
                      Lottie.asset('assets/Animation - 1702028574087.json',width: 250,height: 150,),
/*
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SB(context),
                          SB(context),
                          SB(context),
                          SB(context),
                        ],
                      ),
*/
                      defaultFormField(
                        controller: email,
                        type: TextInputType.emailAddress,
                        hint: "Email Address",
                        lable: 'Email Adress',
                        prefx: Icons.person,
                        validate: "Please enter your email address",
                        onSubmite: (val) {
                          print(val);
                        },
                      ),
                      const SizedBox(height: 25,),
                      EleButton(s:'Confirm',f:(){
                        if(formkey.currentState!.validate()){

                          print(code.text);
                          Navigator.pop(context);}



                      } ),
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

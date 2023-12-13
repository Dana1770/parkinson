import 'package:flutter/material.dart';
import 'package:grad_pro/CareGiver/CareGiverLogin.dart';
import 'package:grad_pro/NormalUser/NormalUserLogin.dart';
import 'package:grad_pro/components/components.dart';
import 'package:lottie/lottie.dart';

import '../Doctor/doctorLogin.dart';
class choose extends StatefulWidget {
  const choose({super.key});

  @override
  State<choose> createState() => _chooseState();
}
class _chooseState extends State<choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0,bottom: 50,right: 30,left: 30),
          child: Container(
            width: 700,
            height: 700,
            decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(40),

            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Lottie.asset('assets/Animation - 1701883123611.json',width: 240,height: 140,)),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 15),
                    child: Text('Sign up Now',style: TextStyle(color: Colors.orange[900],fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'Tilt Neon'),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0,top: 10),
                    child: Text('Sign up to continue using App',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 100,),
                  Center(child: EleButton(s: 'Doctor',f: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>doctorLogin()));
                  })),
                  SizedBox(height: 20,),
                  Center(child: EleButton(s: 'Caregiver',f: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CareGiverLogin()));
                  })),
                  SizedBox(height: 20,),
                  Center(child: EleButton(s: 'User',f: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NormalUserLogin()));


                  })),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

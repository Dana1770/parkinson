import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../choose/choose.dart';
import '../components/components.dart';

class Verification_Code extends StatefulWidget {
  const Verification_Code({super.key});

  @override
  State<Verification_Code> createState() => _Verification_CodeState();
}

class _Verification_CodeState extends State<Verification_Code> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],

      body: Padding(
        padding: const EdgeInsets.all(30.0),
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
                    Lottie.asset('assets/Animation - 1702042734061.json',width: 250,height: 150,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SB(context),
                        SB(context),
                        SB(context),
                        SB(context),
                      ],
                    ),


                    const SizedBox(height: 25,),
                    EleButton(s:'Confirm',f:(){




                    } ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

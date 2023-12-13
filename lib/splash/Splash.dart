import 'package:flutter/material.dart';
import 'package:grad_pro/OnBoarding/onBoarding.dart';
import 'package:grad_pro/choose/choose.dart';
import '../components/components.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startSplachTimer(context, OnBoarding());
  }
  @override
  Widget build(BuildContext context) {
return const Scaffold(
  body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("Parkinson",
        style: TextStyle(
            color: Color(0xFFE65100),
            //color: Colors.orange,
            fontSize: 50,
            letterSpacing: 6,
            fontWeight: FontWeight.bold,
            fontFamily: 'Dancing Script'
        ),),

      Center(child: Image(image: AssetImage('assets/394037115_1062664108101812_5259906680491146500_n.jpg'),width: 250,height: 280,)),
     // SizedBox(height: 3,),

    ],
  ),
);
  }
}

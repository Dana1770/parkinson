import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../OnBoarding/onBoarding.dart';
Widget build_icon(String p1, String p2 ){
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 10),
          child: ElevatedButton(onPressed: () {

          },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Colors.white),
              iconSize: MaterialStateProperty.all(70),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(image: NetworkImage(
                  p1),
                fit: BoxFit.cover, height: 150, width: 145,),
            ),),
        ),
        ElevatedButton(onPressed: () {

        },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Colors.white),
            iconSize: MaterialStateProperty.all(100),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(image: NetworkImage(
                p2),
              fit: BoxFit.cover, height: 150, width: 145,),
          ),),
      ],
    ),
  ) ;

}
Widget Large_image(String t)=> Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Image(image:AssetImage(t)));
Widget small_image(String t)=>Container(
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
  clipBehavior: Clip.antiAliasWithSaveLayer,
  child: Image(image: AssetImage(t),
    height: 120,
    width: 120,

  ),
);
Widget defaultFormField({
  required TextEditingController controller,
  TextInputType? type,
  Function(String)? onSubmite,
  Function(String)? onChange,
  VoidCallback? onTap,
  bool isPassword = false,
  validate,
  String? lable,
  IconData? prefx,
  Widget? suffix,
  VoidCallback? suffixPassword,
  Color? fillcolor,
  bool? Isfilled,
  double borderradius = 4.0,
  String hint = " ",
  Color? iconColor,
  Color? textColor,
  double w=0,
}) =>
    TextFormField(
      
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted: onSubmite,
      validator: (value){ if (value!.isEmpty) {
        return validate;
      }},
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(w),
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xFFE65100)),
          labelStyle:  TextStyle(color: Colors.black),
          fillColor: fillcolor,
          filled: Isfilled,
          labelText: lable,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide:  BorderSide(
                color: Color(0xFFE65100),

            ),
          ),
          focusedErrorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide:  BorderSide(
              color:  Color(0xFFE65100),

            ),
          ) ,
          errorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide:  BorderSide(
              color:  Colors.redAccent,

            ),

          ) ,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide:  BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          prefixIcon: prefx == null
              ? null
              : Icon(
            prefx,
            color: iconColor,
          ),
         suffix: suffix,



          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderradius)))),
    );
Future navigateAndFinish (context,widget)=>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(
            builder: (context)=>widget),
            (Route<dynamic>route)=>false);
Widget divider()=>const Divider(indent: 10,height: 10,color: Colors.black,endIndent: 50,thickness: 4,);
Widget EleButton ({VoidCallback?f,required String s})=> Container(
  width: 220,
  child: ElevatedButton(
style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
    onPressed: f,
    child:Text(s,style: TextStyle(color: Colors.white,fontSize: 20),),),
);
Widget QROE({String? t,context,w,String?t1})=> Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(t!),
    TextButton(
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(
                builder: (context)=>w),
          );
        }, child: Text(t1!,style: TextStyle(color: Colors.blue[900]),)),
  ],
);
startSplachTimer(context,w){
  Timer(const Duration(seconds: 5),()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>w))
  );
}
Widget SB (context)=> SizedBox(height: 58,width: 54,child: TextFormField(style: Theme.of(context).textTheme.headlineSmall,
  decoration: InputDecoration(border: OutlineInputBorder()),
  keyboardType: TextInputType.number,
  textAlign: TextAlign.center,
  inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],
),);
Widget linkButton(VoidCallback?f,String? s,String? s1)=>  ElevatedButton(
  onPressed: f,
  child: Row(
    children: [
      Image(image: AssetImage(s1!),width: 15,height: 15,),
      SizedBox(width: 5),
      Text(s!,style: TextStyle(color: Colors.black),)
    ],
  ),);
List <DropdownMenuItem<String>> Types=[
  DropdownMenuItem(value: 'Male',
    child: Text('Male',style: TextStyle(color: Colors.black)),
  ),
  DropdownMenuItem(value: 'Female',
    child:Text('Female',style: TextStyle(color: Colors.black)),

  ),



];
Widget build_Boarding_Item (BordingMODEL model,VoidCallback?v)=> Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    TextButton(onPressed: v, child: Text('Skip',style: TextStyle(color: Colors.orange[900],fontWeight: FontWeight.bold,fontSize: 18),)),
    Center(
      child: Lottie.asset(model.image,width: 350,height: 300,),
    ),
    Center(
      child: Text(model.title,
       maxLines: 5,
        style:  TextStyle(
          letterSpacing: 3,
          wordSpacing: 1,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Tilt Neon',
        ),),
    ),
    const SizedBox(height: 5,),



//*
  ],
) ;
Widget FAB({context,Widget? w,VoidCallback?fun})=> Container(
  height: 50,
  width: 60,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(35),
  ),
  child:   IconButton(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange[900])),
    onPressed: fun,
    icon: Icon(Icons.arrow_forward_ios,color: Colors.white,),),
);
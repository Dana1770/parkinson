import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_pro/NormalUser/NormalUserLogin.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../Doctor/doctorLogin.dart';
import '../Variable.dart';
import '../components/components.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}
class _UserSignUpState extends State<UserSignUp> {
  var  formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0,right: 30,left: 30,bottom: 30),
              child: Container(
                width: 500,
                height: 940,
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(40),

                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0,right: 15,left: 15),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Lottie.asset('assets/Animation - 1702025432649.json',width: 300,height: 170,),
                      Center(
                        child: const Text("Sign Up \nAs Normal user🧑️",
                          style: TextStyle(
                              color: Color(0xFFE65100),
                              fontSize: 20,
                              letterSpacing: 6,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Tilt Neon'
                          ),),
                      ),
                      SizedBox(height: 15,),

                      defaultFormField(
                          controller:PName,
                          type:TextInputType.name,
                          hint: "Name",
                          lable: 'Name',
                          prefx: Icons.person,
                          validate: "Please enter your Name",
                          onSubmite: (val){print(val);},
                          w: 15
                      ),
                      SizedBox(height: 20,),
                      defaultFormField(
                          controller:PUserName,
                          type:TextInputType.name,
                          hint: "User Name",
                          lable: 'User Name',
                          prefx: Icons.edit,
                          validate: "Please enter User Name",
                          onSubmite: (val){print(val);},
                          w: 15
                      ),
                      SizedBox(height: 20,),

                      defaultFormField(
                        controller:PdateController,
                        hint: "Date of birth",
                        lable: 'Date of birth',
                        prefx: Icons.date_range,
                        validate: "Please enter your date of birth",
                        onSubmite: (val){print(val);},
                        w: 15,
                        onChange:(val){
                          PdateController.text=val;
                        },
                        onTap: (){
                          showDatePicker(
                            context: context,
                            initialDate:DateTime.now(),
                            firstDate: DateTime.parse('1900-01-01'),
                            lastDate:DateTime.parse('2100-12-03'), ).then((value){
                            PdateController.text=DateFormat.yMMMd().format(value!);

                          });
                        },


                      ),
                      SizedBox(height: 20,),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.man),
                          contentPadding:   EdgeInsets.all(15),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide:  BorderSide(
                              color: Color(0xFFE65100),

                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide:  BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                        ),
                        hint: const Text('Gender',style: TextStyle(color: Colors.black ),),
                        dropdownColor: Colors.white,
                        items:Types ,
                        onChanged: (String? val){
                          setState(() {
                            // gender.text=val!;
                            selectedType=val;
                            Pgender.text=val!;

                          });

                        },
                        borderRadius: BorderRadius.circular(20),

                      ),
                      SizedBox(height: 20,),
                      defaultFormField(
                          controller:PPhone,
                          type:TextInputType.number,
                          hint: "Phone Number",
                          lable: 'Phone Number',
                          prefx: Icons.phone,
                          validate: "Please enter your phone",
                          onSubmite: (val){print(val);},
                          w: 15
                      ),
                      SizedBox(height: 20,),
                      defaultFormField(
                          controller:PEmail,
                          type:TextInputType.emailAddress,
                          hint: "Email Address",
                          lable: 'Email Address',
                          prefx: Icons.email,
                          validate: "Please enter your email",
                          onSubmite: (val){print(val);},
                          w: 15
                      ),
                      SizedBox(height: 20,),

                      defaultFormField(
                        controller: Ppassword,
                        type: TextInputType.visiblePassword,
                        hint: "Password",
                        lable: 'Password',
                        prefx: Icons.lock,
                        isPassword: isPass,
                        validate: "Please enter your password",
                        onSubmite: (val) {
                          print(val);
                        },),
                      SizedBox(height: 20,),

                      defaultFormField(
                        controller: PCPassword,
                        type: TextInputType.visiblePassword,
                        hint: "Confirm Password",
                        lable: 'Confirm Password',
                        prefx: Icons.check,
                        isPassword: isPass,
                        validate: "Please enter your password",
                        onSubmite: (val) {
                          print(val);
                        },),

                      SizedBox(height: 10,),
                      EleButton(s: 'Register',f:(){
                        if(formkey.currentState!.validate()){

                          print(code.text);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NormalUserLogin()));}



                      } ),
                      QROE(t: "Have an account ?",w:const NormalUserLogin(),t1:"log in" ,context: context ),







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

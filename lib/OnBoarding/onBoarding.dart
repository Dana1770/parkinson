import 'package:flutter/material.dart';
import 'package:grad_pro/choose/choose.dart';
import '../cacheHelper/cacheHelper.dart';
import '../components/components.dart';
class BordingMODEL{
  final String image;
  final String title;
  BordingMODEL(this.image,this.title);
}
class OnBoarding extends StatefulWidget{
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}
class _OnBoardingState extends State<OnBoarding> {
  double size=200.0;
var boardController=PageController();
  List <BordingMODEL>bording=[
    BordingMODEL('assets/Animation - 1702035021033.json',
        'Parkinson\'s disease is a neurodegenerative disorder that affects movement control',
       ),
    BordingMODEL('assets/Animation - 1702036044085.json',
      'It is characterized by symptoms such as tremors, bradykinesia (slowness of movement)',
    ),
    BordingMODEL('assets/Animation - 1702036529263.json',
      'Parkinson\'s disease progressively worsens over time, impacting a person\'s ability to perform everyday activities ',
    ),
  ];
void submit(){

CacheHelper.SetData(key: 'onBoarding', value: true).then((value) {
  if(value){
    navigateAndFinish(context, choose());
  }
});

}
  bool isLast=false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     backgroundColor:  Colors.orange[100],
     body:SafeArea(
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
             child: Column(

               children: [

                 Expanded(

                   child: PageView.builder(
                     physics: const BouncingScrollPhysics(),
                     onPageChanged: (int index){
                       if(index==bording.length-1){
                         print('last');
                        setState(() {
                          isLast=true;
                        });
                       }
                       else{
                         print('not last');
                         setState(() {
                           isLast=false;
                         });
                       }
                     },
                     controller: boardController,
                     itemBuilder: (context,index)=>build_Boarding_Item(bording[index],(){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>choose()));
                     }),

                   itemCount: bording.length,



                   ),

                 ),
                // const SizedBox(height: 30,),

                 Padding(
                   padding: const EdgeInsets.only(bottom: 20.0,right: 5),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                    FAB(context: context,fun:(){
                      boardController.nextPage(duration: Duration(microseconds: 750), curve: Curves.bounceInOut);
                      if(isLast){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>choose()));
                      }
                      else{

                      }

                    }  ),

                      // const Spacer(),


                     ],

                   ),
                 ),

               ],

             ),
           ),
         ),
       ),
     ) ,
   );



  }

}
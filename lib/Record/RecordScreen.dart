import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
class recordScreen extends StatefulWidget {
  const recordScreen({super.key});

  @override
  State<recordScreen> createState() => _recordScreenState();
}
class _recordScreenState extends State<recordScreen> {
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  String audioPath = ' ';
  @override
  void initState() {
    audioPlayer = AudioPlayer();
    audioRecord = Record();
    super.initState();
  }
  @override
  void dispose() {
    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      print('Error start recording $e');
    }
  }
  Future<void> playRecording() async {
    try {
      if (!isRecording && audioPath != null) {
        Source urlSource = UrlSource(audioPath);
        await audioPlayer.play(urlSource);
      }
    } catch (e) {
      print('Error playing Recording $e');
    }
  }
  Future<void> stopRecording() async{
    try {

        String? path = await audioRecord.stop();

          setState(() {
            isRecording = false;
            audioPath = path!;
            print(audioPath);
          });



    } catch (e) {
      print('Error stopping recording: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(70.0),
            child: Text(
              "Parkinson",
              style: TextStyle(
                color: Color(0xFFE65100),
                fontSize: 45,
                letterSpacing: 6,
                fontWeight: FontWeight.bold,
                fontFamily: 'Dancing Script',
              ),
            ),
          ),
          SizedBox(height: 20,),
          Align(
            child: Container(
              width: double.infinity,
              height: 140,
              color: Colors.orange[700],
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Image(image: AssetImage('assets/smartphone.png'), width: 110),
                  ),
                  Text(
                    'Hold your phone and \n start recording',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Tilt Neon',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 100,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              if (isRecording)
                const Text('Recording is in Progress', style: TextStyle(fontSize: 20)),

              Padding(
                padding: const EdgeInsets.only(top: 160.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE65100))),
                        onPressed: isRecording?stopRecording:startRecording,
                        child: isRecording ? const Text('Stop Recording',style: TextStyle(color: Colors.white),):const Text('Start Recording',style: TextStyle(color: Colors.white),),
                      ),
                      const SizedBox(width: 20),
                      if (!isRecording && audioPath != null)
                        ElevatedButton(onPressed: playRecording,style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFE65100))), child: const Text('Play Record',style: TextStyle(color: Colors.white)),),


    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}



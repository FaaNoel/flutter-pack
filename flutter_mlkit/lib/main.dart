import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FacePage(),
    );
  }
}

class FacePage extends StatefulWidget {
  @override
  _FacePageState createState() => _FacePageState();
}

class _FacePageState extends State<FacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Detector'),
      ),

      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
          tooltip: 'Pick an Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

final imageFile = await ImagePicker.pickImage(
source: ImageSource.gallery,
);

final image = FirebaseVisionImage.fromFile(imageFile);
final faceDetector = FirebaseVision.instance.faceDetector(
  FaceDetectorOptions(
    mode:  FaceDetectorMode.accurate,
    enableLandmarks: true,
  )
);


class Face{
  final Rectangle<int> boundingBox;
  final double headEulerAngleY;
  final double headEulerAngleZ;
  final double leftEyeOpenProbability;
  final double rightEyeOpenProbability;
  final double smilingProbability;
  final int trackingId;
  FaceLandmark getLandmark(
      )
}


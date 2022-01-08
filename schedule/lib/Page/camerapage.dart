import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//
// class CameraPage extends StatelessWidget {
//
//   final List<CameraDescription> cameras;
//   const CameraPage({Key? key, required this.cameras}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CameraScreen(cameras: cameras,),
//     );
//   }
// }

class CameraPage extends StatefulWidget {
  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  File? _selectedFile;
  bool _inProcess = false;


  Future getImage(ImageSource source) async {
        File image = await ImagePicker.pickImage(source: source);
      setState(() {
        _selectedFile=image;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
             //   getImageWidget(),
                Container(
                  child: _selectedFile ==null ? Text("Photo needed") : Image.file(_selectedFile!),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                        color: Colors.green,
                        child: Text(
                          "Camera",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          getImage(ImageSource.camera);
                        }),
                    MaterialButton(
                        color: Colors.deepOrange,
                        child: Text(
                          "Device",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        })
                  ],
                )
              ],
            ),
            (_inProcess)?Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.95,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ):Center()
          ],
        )
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  File? _selectedFile;
  bool _inProcess = false;
  String firstButtonText = 'Take photo';

  Future getImage(ImageSource source) async {
    ImagePicker.pickImage(source: source)
        .then((File recordedImage) {
      final imageTemporary = File(recordedImage.path);
      setState(() {
        _selectedFile = imageTemporary;
        firstButtonText = 'saving in progress...';
      });
      
      //save if image is captured from camera
      if(source == ImageSource.camera)
      GallerySaver.saveImage(recordedImage.path);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.green,Colors.lightGreen]),
          ),
          padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  Spacer(),
                   _selectedFile !=null
                      ? Image.file(
                    _selectedFile!,
                    width: 400,
                    height: 500,
                    fit: BoxFit.cover,
                  )
                      : FlutterLogo(size: 400,),
                  const SizedBox(height: 50),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            TextButton(
                            style: TextButton.styleFrom(
                              fixedSize: Size(100, 56),
                              backgroundColor: Colors.white54,
                              primary: Colors.black,),
                            onPressed: ()=> getImage(ImageSource.camera),
                            child: Column(
                              children: <Widget>[
                                Text("Pick Camera"),
                                Icon(Icons.camera_alt_rounded),
                              ],
                            ),
                          ),
                            SizedBox(
                              width: 30,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                fixedSize: Size(100, 56),
                                backgroundColor: Colors.white54,
                                primary: Colors.black,),
                              onPressed: ()=> getImage(ImageSource.gallery),
                              child: Column(
                                children: <Widget>[
                                  Text("Pick Gallery"),
                                  Icon(Icons.storage_rounded),
                                ],
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                ],
              ),
        )
    );
  }
}
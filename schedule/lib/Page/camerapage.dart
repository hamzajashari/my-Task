import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    try {

      final image = await ImagePicker.pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        _selectedFile = imageTemporary;
      });
    }
    on PlatformException catch(e){
      print('Failed to pick image: $e');
    }
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
                    height: 400,
                    fit: BoxFit.cover,
                  )
                      : FlutterLogo(size: 400,),
                  const SizedBox(height: 40),

                      TextButton(
                        style: TextButton.styleFrom(
                          fixedSize: Size(100, 56),
                          backgroundColor: Colors.white38,
                          primary: Colors.amber,),
                        onPressed: ()=> getImage(ImageSource.camera),
                        child: Column(
                          children: <Widget>[
                            Text("Pick Camera"),
                            Icon(Icons.camera_alt_rounded),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          fixedSize: Size(100, 56),
                          backgroundColor: Colors.white38,
                          primary: Colors.amber,),
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
        )
    );
  }
}
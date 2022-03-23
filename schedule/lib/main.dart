import 'package:bottomnavbar/Screens/navbarscreen.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Auth/Auth.dart';
import 'Auth/HomePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final cameras = await availableCameras(); //Get list of available cameras
  runApp(MyApp(cameras: cameras));
}
class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }

}
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<User?>(context);
    if (firebaseUser != null) {
      return HomePage();
    }
    return navbarscreen();
  }
}
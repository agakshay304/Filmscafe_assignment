import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lapcare/screens/wrapper.dart';
import 'package:lapcare/services/Auth.dart';
import 'package:provider/provider.dart';
import 'Models/Users.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
     (options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      value: AuthServices().user,
      // initialData: null,
      initialData: Users(uid: ''),
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

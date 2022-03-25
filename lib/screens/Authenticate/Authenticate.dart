import 'package:flutter/material.dart';
import 'package:lapcare/screens/Authenticate/Register.dart';
import 'package:lapcare/screens/Authenticate/Sign_in.dart';


class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Sign_In(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}